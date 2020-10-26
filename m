Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EEBEA298799
	for <lists+linux-samsung-soc@lfdr.de>; Mon, 26 Oct 2020 08:50:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1771039AbgJZHuF (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Mon, 26 Oct 2020 03:50:05 -0400
Received: from mx2.suse.de ([195.135.220.15]:40162 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1771035AbgJZHuF (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 26 Oct 2020 03:50:05 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 9151FAEE0;
        Mon, 26 Oct 2020 07:50:02 +0000 (UTC)
To:     Sam Ravnborg <sam@ravnborg.org>
Cc:     luben.tuikov@amd.com, airlied@linux.ie,
        nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        chris@chris-wilson.co.uk, melissa.srw@gmail.com, ray.huang@amd.com,
        kraxel@redhat.com, emil.velikov@collabora.com,
        linux-samsung-soc@vger.kernel.org, jy0922.shim@samsung.com,
        lima@lists.freedesktop.org, oleksandr_andrushchenko@epam.com,
        krzk@kernel.org, steven.price@arm.com,
        linux-rockchip@lists.infradead.org, kgene@kernel.org,
        alyssa.rosenzweig@collabora.com, linux+etnaviv@armlinux.org.uk,
        spice-devel@lists.freedesktop.org, bskeggs@redhat.com,
        etnaviv@lists.freedesktop.org, hdegoede@redhat.com,
        xen-devel@lists.xenproject.org,
        virtualization@lists.linux-foundation.org, sean@poorly.run,
        apaneers@amd.com, linux-arm-kernel@lists.infradead.org,
        linaro-mm-sig@lists.linaro.org, amd-gfx@lists.freedesktop.org,
        tomeu.vizoso@collabora.com, sw0312.kim@samsung.com,
        hjc@rock-chips.com, kyungmin.park@samsung.com,
        miaoqinglang@huawei.com, yuq825@gmail.com,
        alexander.deucher@amd.com, linux-media@vger.kernel.org,
        christian.koenig@amd.com
References: <20201020122046.31167-1-tzimmermann@suse.de>
 <20201020122046.31167-11-tzimmermann@suse.de>
 <20201024203838.GB93644@ravnborg.org>
From:   Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v5 10/10] drm/fb_helper: Support framebuffers in I/O
 memory
Message-ID: <f97902e4-cf8e-17c6-5a6e-b11da41101c5@suse.de>
Date:   Mon, 26 Oct 2020 08:50:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.3
MIME-Version: 1.0
In-Reply-To: <20201024203838.GB93644@ravnborg.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi

Am 24.10.20 um 22:38 schrieb Sam Ravnborg:
> Hi Thomas.
> 
> On Tue, Oct 20, 2020 at 02:20:46PM +0200, Thomas Zimmermann wrote:
>> At least sparc64 requires I/O-specific access to framebuffers. This
>> patch updates the fbdev console accordingly.
>>
>> For drivers with direct access to the framebuffer memory, the callback
>> functions in struct fb_ops test for the type of memory and call the rsp
>> fb_sys_ of fb_cfb_ functions. Read and write operations are implemented
>> internally by DRM's fbdev helper.
>>
>> For drivers that employ a shadow buffer, fbdev's blit function retrieves
>> the framebuffer address as struct dma_buf_map, and uses dma_buf_map
>> interfaces to access the buffer.
>>
>> The bochs driver on sparc64 uses a workaround to flag the framebuffer as
>> I/O memory and avoid a HW exception. With the introduction of struct
>> dma_buf_map, this is not required any longer. The patch removes the rsp
>> code from both, bochs and fbdev.
>>
>> v5:
>> 	* implement fb_read/fb_write internally (Daniel, Sam)
>> v4:
>> 	* move dma_buf_map changes into separate patch (Daniel)
>> 	* TODO list: comment on fbdev updates (Daniel)
>>
>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>> Tested-by: Sam Ravnborg <sam@ravnborg.org>
> Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
> 
> But see a few comments below on naming for you to consider.
> 
> 	Sam
> 
>> ---
>>  Documentation/gpu/todo.rst        |  19 ++-
>>  drivers/gpu/drm/bochs/bochs_kms.c |   1 -
>>  drivers/gpu/drm/drm_fb_helper.c   | 227 ++++++++++++++++++++++++++++--
>>  include/drm/drm_mode_config.h     |  12 --
>>  4 files changed, 230 insertions(+), 29 deletions(-)
>>
>> diff --git a/Documentation/gpu/todo.rst b/Documentation/gpu/todo.rst
>> index 7e6fc3c04add..638b7f704339 100644
>> --- a/Documentation/gpu/todo.rst
>> +++ b/Documentation/gpu/todo.rst
>> @@ -197,13 +197,28 @@ Convert drivers to use drm_fbdev_generic_setup()
>>  ------------------------------------------------
>>  
>>  Most drivers can use drm_fbdev_generic_setup(). Driver have to implement
>> -atomic modesetting and GEM vmap support. Current generic fbdev emulation
>> -expects the framebuffer in system memory (or system-like memory).
>> +atomic modesetting and GEM vmap support. Historically, generic fbdev emulation
>> +expected the framebuffer in system memory or system-like memory. By employing
>> +struct dma_buf_map, drivers with frambuffers in I/O memory can be supported
>> +as well.
>>  
>>  Contact: Maintainer of the driver you plan to convert
>>  
>>  Level: Intermediate
>>  
>> +Reimplement functions in drm_fbdev_fb_ops without fbdev
>> +-------------------------------------------------------
>> +
>> +A number of callback functions in drm_fbdev_fb_ops could benefit from
>> +being rewritten without dependencies on the fbdev module. Some of the
>> +helpers could further benefit from using struct dma_buf_map instead of
>> +raw pointers.
>> +
>> +Contact: Thomas Zimmermann <tzimmermann@suse.de>, Daniel Vetter
>> +
>> +Level: Advanced
>> +
>> +
>>  drm_framebuffer_funcs and drm_mode_config_funcs.fb_create cleanup
>>  -----------------------------------------------------------------
>>  
>> diff --git a/drivers/gpu/drm/bochs/bochs_kms.c b/drivers/gpu/drm/bochs/bochs_kms.c
>> index 13d0d04c4457..853081d186d5 100644
>> --- a/drivers/gpu/drm/bochs/bochs_kms.c
>> +++ b/drivers/gpu/drm/bochs/bochs_kms.c
>> @@ -151,7 +151,6 @@ int bochs_kms_init(struct bochs_device *bochs)
>>  	bochs->dev->mode_config.preferred_depth = 24;
>>  	bochs->dev->mode_config.prefer_shadow = 0;
>>  	bochs->dev->mode_config.prefer_shadow_fbdev = 1;
>> -	bochs->dev->mode_config.fbdev_use_iomem = true;
>>  	bochs->dev->mode_config.quirk_addfb_prefer_host_byte_order = true;
>>  
>>  	bochs->dev->mode_config.funcs = &bochs_mode_funcs;
>> diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
>> index 6212cd7cde1d..1d3180841778 100644
>> --- a/drivers/gpu/drm/drm_fb_helper.c
>> +++ b/drivers/gpu/drm/drm_fb_helper.c
>> @@ -372,24 +372,22 @@ static void drm_fb_helper_resume_worker(struct work_struct *work)
>>  }
>>  
>>  static void drm_fb_helper_dirty_blit_real(struct drm_fb_helper *fb_helper,
>> -					  struct drm_clip_rect *clip)
>> +					  struct drm_clip_rect *clip,
>> +					  struct dma_buf_map *dst)
>>  {
>>  	struct drm_framebuffer *fb = fb_helper->fb;
>>  	unsigned int cpp = fb->format->cpp[0];
>>  	size_t offset = clip->y1 * fb->pitches[0] + clip->x1 * cpp;
>>  	void *src = fb_helper->fbdev->screen_buffer + offset;
>> -	void *dst = fb_helper->buffer->map.vaddr + offset;
>>  	size_t len = (clip->x2 - clip->x1) * cpp;
>>  	unsigned int y;
>>  
>> -	for (y = clip->y1; y < clip->y2; y++) {
>> -		if (!fb_helper->dev->mode_config.fbdev_use_iomem)
>> -			memcpy(dst, src, len);
>> -		else
>> -			memcpy_toio((void __iomem *)dst, src, len);
>> +	dma_buf_map_incr(dst, offset); /* go to first pixel within clip rect */
>>  
>> +	for (y = clip->y1; y < clip->y2; y++) {
>> +		dma_buf_map_memcpy_to(dst, src, len);
>> +		dma_buf_map_incr(dst, fb->pitches[0]);
>>  		src += fb->pitches[0];
>> -		dst += fb->pitches[0];
>>  	}
>>  }
>>  
>> @@ -417,8 +415,9 @@ static void drm_fb_helper_dirty_work(struct work_struct *work)
>>  			ret = drm_client_buffer_vmap(helper->buffer, &map);
>>  			if (ret)
>>  				return;
>> -			drm_fb_helper_dirty_blit_real(helper, &clip_copy);
>> +			drm_fb_helper_dirty_blit_real(helper, &clip_copy, &map);
>>  		}
>> +
>>  		if (helper->fb->funcs->dirty)
>>  			helper->fb->funcs->dirty(helper->fb, NULL, 0, 0,
>>  						 &clip_copy, 1);
>> @@ -2027,6 +2026,206 @@ static int drm_fbdev_fb_mmap(struct fb_info *info, struct vm_area_struct *vma)
>>  		return -ENODEV;
>>  }
>>  
>> +static bool drm_fbdev_use_iomem(struct fb_info *info)
>> +{
>> +	struct drm_fb_helper *fb_helper = info->par;
>> +	struct drm_client_buffer *buffer = fb_helper->buffer;
>> +
>> +	return !drm_fbdev_use_shadow_fb(fb_helper) && buffer->map.is_iomem;
>> +}
>> +
>> +static ssize_t fb_read_screen_base(struct fb_info *info, char __user *buf, size_t count, 
>> +				   loff_t pos)
> The naming here confused me - a name like:
> fb_read_iomem() would have helped me more.
> With the current naming I shall remember that the screen_base member is
> the iomem pointer.

Yeah, true. In terms of naming, I was undecided. I was thinking about
adopting a naming similar to what you describe, but OTOH we don't use
sysmem anywhere in the code. I thought about adopting fbdev's conention
of using _sys_ and _cfb_. But that would make sensein the local context.

> 
>> +{
>> +	const char __iomem *src = info->screen_base + pos;
>> +	size_t alloc_size = min(count, PAGE_SIZE);
>> +	ssize_t ret = 0;
>> +	char *tmp;
>> +
>> +	tmp = kmalloc(alloc_size, GFP_KERNEL);
>> +	if (!tmp)
>> +		return -ENOMEM;
>> +
> 
> I looked around and could not find other places where
> we copy from iomem to mem to usermem in chunks of PAGE_SIZE.

I took this pattern from fbdev's original implementation. I think it's
done to work nicely with kmalloc.

Best regards
Thomas

> 
>> +	while (count) {
>> +		size_t c = min(count, alloc_size);
>> +
>> +		memcpy_fromio(tmp, src, c);
>> +		if (copy_to_user(buf, tmp, c)) {
>> +			ret = -EFAULT;
>> +			break;
>> +		}
>> +
>> +		src += c;
>> +		buf += c;
>> +		ret += c;
>> +		count -= c;
>> +	}
>> +
>> +	kfree(tmp);
>> +
>> +	return ret;
>> +}
>> +
>> +static ssize_t fb_read_screen_buffer(struct fb_info *info, char __user *buf, size_t count,
>> +				     loff_t pos)
> And fb_read_sysmem() here.
> 
>> +{
>> +	const char *src = info->screen_buffer + pos;
>> +
>> +	if (copy_to_user(buf, src, count))
>> +		return -EFAULT;
>> +
>> +	return count;
>> +}
>> +
>> +static ssize_t drm_fbdev_fb_read(struct fb_info *info, char __user *buf,
>> +				 size_t count, loff_t *ppos)
>> +{
>> +	loff_t pos = *ppos;
>> +	size_t total_size;
>> +	ssize_t ret;
>> +
>> +	if (info->state != FBINFO_STATE_RUNNING)
>> +		return -EPERM;
>> +
>> +	if (info->screen_size)
>> +		total_size = info->screen_size;
>> +	else
>> +		total_size = info->fix.smem_len;
>> +
>> +	if (pos >= total_size)
>> +		return 0;
>> +	if (count >= total_size)
>> +		count = total_size;
>> +	if (total_size - count < pos)
>> +		count = total_size - pos;
>> +
>> +	if (drm_fbdev_use_iomem(info))
>> +		ret = fb_read_screen_base(info, buf, count, pos);
>> +	else
>> +		ret = fb_read_screen_buffer(info, buf, count, pos);
>> +
>> +	if (ret > 0)
>> +		*ppos = ret;
>> +
>> +	return ret;
>> +}
>> +
>> +static ssize_t fb_write_screen_base(struct fb_info *info, const char __user *buf, size_t count,
>> +				    loff_t pos)
> 
> fb_write_iomem()
> 
>> +{
>> +	char __iomem *dst = info->screen_base + pos;
>> +	size_t alloc_size = min(count, PAGE_SIZE);
>> +	ssize_t ret = 0;
>> +	u8 *tmp;
>> +
>> +	tmp = kmalloc(alloc_size, GFP_KERNEL);
>> +	if (!tmp)
>> +		return -ENOMEM;
>> +
>> +	while (count) {
>> +		size_t c = min(count, alloc_size);
>> +
>> +		if (copy_from_user(tmp, buf, c)) {
>> +			ret = -EFAULT;
>> +			break;
>> +		}
>> +		memcpy_toio(dst, tmp, c);
>> +
>> +		dst += c;
>> +		buf += c;
>> +		ret += c;
>> +		count -= c;
>> +	}
>> +
>> +	kfree(tmp);
>> +
>> +	return ret;
>> +}
>> +
>> +static ssize_t fb_write_screen_buffer(struct fb_info *info, const char __user *buf, size_t count,
>> +				      loff_t pos)
> fb_write_sysmem()
> 
>> +{
>> +	char *dst = info->screen_buffer + pos;
>> +
>> +	if (copy_from_user(dst, buf, count))
>> +		return -EFAULT;
>> +
>> +	return count;
>> +}
>> +
>> +static ssize_t drm_fbdev_fb_write(struct fb_info *info, const char __user *buf,
>> +				  size_t count, loff_t *ppos)
>> +{
>> +	loff_t pos = *ppos;
>> +	size_t total_size;
>> +	ssize_t ret;
>> +	int err;
>> +
>> +	if (info->state != FBINFO_STATE_RUNNING)
>> +		return -EPERM;
>> +
>> +	if (info->screen_size)
>> +		total_size = info->screen_size;
>> +	else
>> +		total_size = info->fix.smem_len;
>> +
>> +	if (pos > total_size)
>> +		return -EFBIG;
>> +	if (count > total_size) {
>> +		err = -EFBIG;
>> +		count = total_size;
>> +	}
>> +	if (total_size - count < pos) {
>> +		if (!err)
>> +			err = -ENOSPC;
>> +		count = total_size - pos;
>> +	}
>> +
>> +	/*
>> +	 * Copy to framebuffer even if we already logged an error. Emulates
>> +	 * the behavior of the original fbdev implementation.
>> +	 */
>> +	if (drm_fbdev_use_iomem(info))
>> +		ret = fb_write_screen_base(info, buf, count, pos);
>> +	else
>> +		ret = fb_write_screen_buffer(info, buf, count, pos);
>> +
>> +	if (ret > 0)
>> +		*ppos = ret;
>> +
>> +	if (err)
>> +		return err;
>> +
>> +	return ret;
>> +}
>> +
>> +static void drm_fbdev_fb_fillrect(struct fb_info *info,
>> +				  const struct fb_fillrect *rect)
>> +{
>> +	if (drm_fbdev_use_iomem(info))
>> +		drm_fb_helper_cfb_fillrect(info, rect);
>> +	else
>> +		drm_fb_helper_sys_fillrect(info, rect);
>> +}
>> +
>> +static void drm_fbdev_fb_copyarea(struct fb_info *info,
>> +				  const struct fb_copyarea *area)
>> +{
>> +	if (drm_fbdev_use_iomem(info))
>> +		drm_fb_helper_cfb_copyarea(info, area);
>> +	else
>> +		drm_fb_helper_sys_copyarea(info, area);
>> +}
>> +
>> +static void drm_fbdev_fb_imageblit(struct fb_info *info,
>> +				   const struct fb_image *image)
>> +{
>> +	if (drm_fbdev_use_iomem(info))
>> +		drm_fb_helper_cfb_imageblit(info, image);
>> +	else
>> +		drm_fb_helper_sys_imageblit(info, image);
>> +}
>> +
>>  static const struct fb_ops drm_fbdev_fb_ops = {
>>  	.owner		= THIS_MODULE,
>>  	DRM_FB_HELPER_DEFAULT_OPS,
>> @@ -2034,11 +2233,11 @@ static const struct fb_ops drm_fbdev_fb_ops = {
>>  	.fb_release	= drm_fbdev_fb_release,
>>  	.fb_destroy	= drm_fbdev_fb_destroy,
>>  	.fb_mmap	= drm_fbdev_fb_mmap,
>> -	.fb_read	= drm_fb_helper_sys_read,
>> -	.fb_write	= drm_fb_helper_sys_write,
>> -	.fb_fillrect	= drm_fb_helper_sys_fillrect,
>> -	.fb_copyarea	= drm_fb_helper_sys_copyarea,
>> -	.fb_imageblit	= drm_fb_helper_sys_imageblit,
>> +	.fb_read	= drm_fbdev_fb_read,
>> +	.fb_write	= drm_fbdev_fb_write,
>> +	.fb_fillrect	= drm_fbdev_fb_fillrect,
>> +	.fb_copyarea	= drm_fbdev_fb_copyarea,
>> +	.fb_imageblit	= drm_fbdev_fb_imageblit,
>>  };
>>  
>>  static struct fb_deferred_io drm_fbdev_defio = {
>> diff --git a/include/drm/drm_mode_config.h b/include/drm/drm_mode_config.h
>> index 5ffbb4ed5b35..ab424ddd7665 100644
>> --- a/include/drm/drm_mode_config.h
>> +++ b/include/drm/drm_mode_config.h
>> @@ -877,18 +877,6 @@ struct drm_mode_config {
>>  	 */
>>  	bool prefer_shadow_fbdev;
>>  
>> -	/**
>> -	 * @fbdev_use_iomem:
>> -	 *
>> -	 * Set to true if framebuffer reside in iomem.
>> -	 * When set to true memcpy_toio() is used when copying the framebuffer in
>> -	 * drm_fb_helper.drm_fb_helper_dirty_blit_real().
>> -	 *
>> -	 * FIXME: This should be replaced with a per-mapping is_iomem
>> -	 * flag (like ttm does), and then used everywhere in fbdev code.
>> -	 */
>> -	bool fbdev_use_iomem;
>> -
>>  	/**
>>  	 * @quirk_addfb_prefer_xbgr_30bpp:
>>  	 *
>> -- 
>> 2.28.0
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
> 

-- 
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 Nürnberg, Germany
(HRB 36809, AG Nürnberg)
Geschäftsführer: Felix Imendörffer
