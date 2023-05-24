Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2A38A70FF88
	for <lists+linux-samsung-soc@lfdr.de>; Wed, 24 May 2023 22:57:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233621AbjEXU51 (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Wed, 24 May 2023 16:57:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49012 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229646AbjEXU50 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 24 May 2023 16:57:26 -0400
Received: from 189.cn (ptr.189.cn [183.61.185.103])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id F37AE12B;
        Wed, 24 May 2023 13:57:23 -0700 (PDT)
HMM_SOURCE_IP: 10.64.8.41:58142.1244876690
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-114.242.206.180 (unknown [10.64.8.41])
        by 189.cn (HERMES) with SMTP id 51D8A100213;
        Thu, 25 May 2023 04:57:21 +0800 (CST)
Received: from  ([114.242.206.180])
        by gateway-151646-dep-75648544bd-xwndj with ESMTP id e61342de702a4626938f836262ec9ff2 for tzimmermann@suse.de;
        Thu, 25 May 2023 04:57:23 CST
X-Transaction-ID: e61342de702a4626938f836262ec9ff2
X-Real-From: 15330273260@189.cn
X-Receive-IP: 114.242.206.180
X-MEDUSA-Status: 0
Sender: 15330273260@189.cn
Message-ID: <07e6077f-8a5c-54b9-29d0-57f1bc868fef@189.cn>
Date:   Thu, 25 May 2023 04:57:21 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [v4,02/13] fbdev: Add initializer macros for struct fb_ops
Content-Language: en-US
To:     Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
        airlied@gmail.com, maarten.lankhorst@linux.intel.com,
        mripard@kernel.org, javierm@redhat.com, sam@ravnborg.org
Cc:     linux-samsung-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        amd-gfx@lists.freedesktop.org, linux-tegra@vger.kernel.org,
        freedreno@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org
References: <20230524092150.11776-3-tzimmermann@suse.de>
From:   Sui Jingfeng <15330273260@189.cn>
In-Reply-To: <20230524092150.11776-3-tzimmermann@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,FROM_LOCAL_DIGITS,
        FROM_LOCAL_HEX,NICE_REPLY_A,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi,


we love your patch:


On 2023/5/24 17:21, Thomas Zimmermann wrote:
> For framebuffers in I/O and system memory, add macros that set
> struct fb_ops to the respective callback functions.
>
> For deferred I/O, add macros that generate callback functions with
> damage handling. Add initializer macros that set struct fb_ops to
> the generated callbacks.
>
> These macros can remove a lot boilerplate code from fbdev drivers.
> The drivers are supposed to use the macro that is required for its
> framebuffer. Each macro is split into smaller helpers, so that
> drivers with non-standard callbacks can pick and customize callbacks
> as needed. There are individual helper macros for read/write, mmap
> and drawing.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>   include/linux/fb.h | 112 +++++++++++++++++++++++++++++++++++++++++++++
>   1 file changed, 112 insertions(+)
>
> diff --git a/include/linux/fb.h b/include/linux/fb.h
> index 2cf8efcb9e32..731472a2bb62 100644
> --- a/include/linux/fb.h
> +++ b/include/linux/fb.h
> @@ -538,9 +538,31 @@ extern ssize_t fb_io_read(struct fb_info *info, char __user *buf,
>   extern ssize_t fb_io_write(struct fb_info *info, const char __user *buf,
>   			   size_t count, loff_t *ppos);
>   
> +/*
> + * Initializes struct fb_ops for framebuffers in I/O memory.
> + */
> +
> +#define __FB_DEFAULT_IO_OPS_RDWR \
> +	.fb_read	= fb_io_read, \
> +	.fb_write	= fb_io_write
> +
> +#define __FB_DEFAULT_IO_OPS_DRAW \
> +        .fb_fillrect	= cfb_fillrect, \
> +        .fb_copyarea	= cfb_copyarea, \
> +        .fb_imageblit	= cfb_imageblit

Here,  it seems that your text editor replace the tap with space, but 
I'm OK.

I'm asking because I see other __FB__DEFAULT_* macro begin with tabs.

> +#define __FB_DEFAULT_IO_OPS_MMAP \
> +	.fb_mmap	= NULL // default implementation
> +
> +#define FB_DEFAULT_IO_OPS \
> +	__FB_DEFAULT_IO_OPS_RDWR, \
> +	__FB_DEFAULT_IO_OPS_DRAW, \
> +	__FB_DEFAULT_IO_OPS_MMAP
> +
>   /*
>    * Drawing operations where framebuffer is in system RAM
>    */
> +
>   extern void sys_fillrect(struct fb_info *info, const struct fb_fillrect *rect);
>   extern void sys_copyarea(struct fb_info *info, const struct fb_copyarea *area);
>   extern void sys_imageblit(struct fb_info *info, const struct fb_image *image);
> @@ -549,6 +571,27 @@ extern ssize_t fb_sys_read(struct fb_info *info, char __user *buf,
>   extern ssize_t fb_sys_write(struct fb_info *info, const char __user *buf,
>   			    size_t count, loff_t *ppos);
>   
> +/*
> + * Initializes struct fb_ops for framebuffers in system memory.
> + */
> +
> +#define __FB_DEFAULT_SYS_OPS_RDWR \
> +	.fb_read	= fb_sys_read, \
> +	.fb_write	= fb_sys_write
> +
> +#define __FB_DEFAULT_SYS_OPS_DRAW \
> +        .fb_fillrect	= sys_fillrect, \
> +        .fb_copyarea	= sys_copyarea, \
> +        .fb_imageblit	= sys_imageblit
> +
> +#define __FB_DEFAULT_SYS_OPS_MMAP \
> +	.fb_mmap	= NULL // default implementation
> +
> +#define FB_DEFAULT_SYS_OPS \
> +	__FB_DEFAULT_SYS_OPS_RDWR, \
> +	__FB_DEFAULT_SYS_OPS_DRAW, \
> +	__FB_DEFAULT_SYS_OPS_MMAP
> +
>   /* drivers/video/fbmem.c */
>   extern int register_framebuffer(struct fb_info *fb_info);
>   extern void unregister_framebuffer(struct fb_info *fb_info);
> @@ -604,6 +647,75 @@ extern void fb_deferred_io_cleanup(struct fb_info *info);
>   extern int fb_deferred_io_fsync(struct file *file, loff_t start,
>   				loff_t end, int datasync);
>   
> +/*
> + * Generate callbacks for deferred I/O
> + */
> +
> +#define __FB_GEN_DEFAULT_DEFERRED_OPS_RDWR(__prefix, __damage_range, __mode) \
> +	static ssize_t __prefix ## _defio_read(struct fb_info *info, char __user *buf, \
> +					       size_t count, loff_t *ppos) \
> +	{ \
> +		return fb_ ## __mode ## _read(info, buf, count, ppos); \
> +	} \
> +	static ssize_t __prefix ## _defio_write(struct fb_info *info, const char __user *buf, \
> +						size_t count, loff_t *ppos) \
> +	{ \
> +		unsigned long offset = *ppos; \
> +		ssize_t ret = fb_ ## __mode ## _write(info, buf, count, ppos); \
> +		if (ret > 0) \
> +			__damage_range(info, offset, ret); \
> +		return ret; \
> +	}
> +
> +#define __FB_GEN_DEFAULT_DEFERRED_OPS_DRAW(__prefix, __damage_area, __mode) \
> +	static void __prefix ## _defio_fillrect(struct fb_info *info, \
> +						const struct fb_fillrect *rect) \
> +	{ \
> +		__mode ## _fillrect(info, rect); \
> +		__damage_area(info, rect->dx, rect->dy, rect->width, rect->height); \
> +	} \
> +	static void __prefix ## _defio_copyarea(struct fb_info *info, \
> +						const struct fb_copyarea *area) \
> +	{ \
> +		__mode ## _copyarea(info, area); \
> +		__damage_area(info, area->dx, area->dy, area->width, area->height); \
> +	} \
> +	static void __prefix ## _defio_imageblit(struct fb_info *info, \
> +						 const struct fb_image *image) \
> +	{ \
> +		__mode ## _imageblit(info, image); \
> +		__damage_area(info, image->dx, image->dy, image->width, image->height); \
> +	}
> +
> +#define FB_GEN_DEFAULT_DEFERRED_IO_OPS(__prefix, __damage_range, __damage_area) \
> +	__FB_GEN_DEFAULT_DEFERRED_OPS_RDWR(__prefix, __damage_range, io) \
> +	__FB_GEN_DEFAULT_DEFERRED_OPS_DRAW(__prefix, __damage_area, cfb)
> +
> +#define FB_GEN_DEFAULT_DEFERRED_SYS_OPS(__prefix, __damage_range, __damage_area) \
> +	__FB_GEN_DEFAULT_DEFERRED_OPS_RDWR(__prefix, __damage_range, sys) \
> +	__FB_GEN_DEFAULT_DEFERRED_OPS_DRAW(__prefix, __damage_area, sys)
> +
> +/*
> + * Initializes struct fb_ops for deferred I/O.
> + */
> +
> +#define __FB_DEFAULT_DEFERRED_OPS_RDWR(__prefix) \
> +	.fb_read	= __prefix ## _defio_read, \
> +	.fb_write	= __prefix ## _defio_write
> +
> +#define __FB_DEFAULT_DEFERRED_OPS_DRAW(__prefix) \
> +        .fb_fillrect	= __prefix ## _defio_fillrect, \
> +        .fb_copyarea	= __prefix ## _defio_copyarea, \
> +        .fb_imageblit	= __prefix ## _defio_imageblit

Here also,  '.fb_fillrect', '.fb_copyarea' and '.fb_imageblit' begin 
with space, but I'm OK.

I'm asking because I see other __FB__DEFAULT_* macro begin with tabs.

> +#define __FB_DEFAULT_DEFERRED_OPS_MMAP(__prefix) \
> +	.fb_mmap	= fb_deferred_io_mmap
> +
> +#define FB_DEFAULT_DEFERRED_OPS(__prefix) \
> +	__FB_DEFAULT_DEFERRED_OPS_RDWR(__prefix), \
> +	__FB_DEFAULT_DEFERRED_OPS_DRAW(__prefix), \
> +	__FB_DEFAULT_DEFERRED_OPS_MMAP(__prefix)
> +
>   static inline bool fb_be_math(struct fb_info *info)
>   {
>   #ifdef CONFIG_FB_FOREIGN_ENDIAN
