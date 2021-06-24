Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 03CC63B2C6E
	for <lists+linux-samsung-soc@lfdr.de>; Thu, 24 Jun 2021 12:27:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232184AbhFXK3x (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Thu, 24 Jun 2021 06:29:53 -0400
Received: from foss.arm.com ([217.140.110.172]:53066 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231964AbhFXK3x (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 24 Jun 2021 06:29:53 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0846C1063;
        Thu, 24 Jun 2021 03:27:34 -0700 (PDT)
Received: from e110455-lin.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C02563F882;
        Thu, 24 Jun 2021 03:27:33 -0700 (PDT)
Received: by e110455-lin.cambridge.arm.com (Postfix, from userid 1000)
        id 75E09684F2B; Thu, 24 Jun 2021 11:27:32 +0100 (BST)
Date:   Thu, 24 Jun 2021 11:27:32 +0100
From:   Liviu Dudau <liviu.dudau@arm.com>
To:     Thomas Zimmermann <tzimmermann@suse.de>
Cc:     Jani Nikula <jani.nikula@linux.intel.com>, daniel@ffwll.ch,
        airlied@linux.ie, alexander.deucher@amd.com,
        christian.koenig@amd.com, Xinhui.Pan@amd.com,
        james.qian.wang@arm.com, mihail.atanassov@arm.com,
        brian.starkey@arm.com, maarten.lankhorst@linux.intel.com,
        mripard@kernel.org, inki.dae@samsung.com, jy0922.shim@samsung.com,
        sw0312.kim@samsung.com, kyungmin.park@samsung.com,
        krzysztof.kozlowski@canonical.com, xinliang.liu@linaro.org,
        tiantao6@hisilicon.com, john.stultz@linaro.org,
        kong.kongxinwei@hisilicon.com, puck.chen@hisilicon.com,
        laurentiu.palcu@oss.nxp.com, l.stach@pengutronix.de,
        p.zabel@pengutronix.de, shawnguo@kernel.org,
        s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
        linux-imx@nxp.com, chunkuang.hu@kernel.org, matthias.bgg@gmail.com,
        bskeggs@redhat.com, tomba@kernel.org, hjc@rock-chips.com,
        heiko@sntech.de, benjamin.gaignard@linaro.org,
        yannick.fertre@foss.st.com, philippe.cornu@foss.st.com,
        mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
        wens@csie.org, jernej.skrabec@gmail.com, thierry.reding@gmail.com,
        jonathanh@nvidia.com, jyri.sarha@iki.fi, emma@anholt.net,
        linux-graphics-maintainer@vmware.com, zackr@vmware.com,
        hyun.kwon@xilinx.com, laurent.pinchart@ideasonboard.com,
        michal.simek@xilinx.com, rodrigo.vivi@intel.com,
        linux@armlinux.org.uk, kieran.bingham+renesas@ideasonboard.com,
        rodrigosiqueiramelo@gmail.com, melissa.srw@gmail.com,
        hamohammed.sa@gmail.com, linux-samsung-soc@vger.kernel.org,
        nouveau@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
        dri-devel@lists.freedesktop.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-rockchip@lists.infradead.org,
        linux-mediatek@lists.infradead.org, amd-gfx@lists.freedesktop.org,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        linux-tegra@vger.kernel.org, linux-sunxi@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 04/27] drm: Don't test for IRQ support in VBLANK ioctls
Message-ID: <20210624102732.3h7lnsik7mkbphgw@e110455-lin.cambridge.arm.com>
References: <20210624072916.27703-1-tzimmermann@suse.de>
 <20210624072916.27703-5-tzimmermann@suse.de>
 <87im23u1ok.fsf@intel.com>
 <b5e7729f-ed11-e9ca-386e-562feb2bd2b7@suse.de>
 <877dijtzl2.fsf@intel.com>
 <af21db75-584f-aec0-9659-d5386f27b4ea@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <af21db75-584f-aec0-9659-d5386f27b4ea@suse.de>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Thu, Jun 24, 2021 at 11:07:57AM +0200, Thomas Zimmermann wrote:
> Hi
> 
> Am 24.06.21 um 10:51 schrieb Jani Nikula:
> > On Thu, 24 Jun 2021, Thomas Zimmermann <tzimmermann@suse.de> wrote:
> > > Hi
> > > 
> > > Am 24.06.21 um 10:06 schrieb Jani Nikula:
> > > > On Thu, 24 Jun 2021, Thomas Zimmermann <tzimmermann@suse.de> wrote:
> > > > > diff --git a/drivers/gpu/drm/drm_vblank.c b/drivers/gpu/drm/drm_vblank.c
> > > > > index 3417e1ac7918..10fe16bafcb6 100644
> > > > > --- a/drivers/gpu/drm/drm_vblank.c
> > > > > +++ b/drivers/gpu/drm/drm_vblank.c
> > > > > @@ -1748,8 +1748,16 @@ int drm_wait_vblank_ioctl(struct drm_device *dev, void *data,
> > > > >    	unsigned int pipe_index;
> > > > >    	unsigned int flags, pipe, high_pipe;
> > > > > -	if (!dev->irq_enabled)
> > > > > -		return -EOPNOTSUPP;
> > > > > +#if defined(CONFIG_DRM_LEGACY)
> > > > > +	if  (unlikely(drm_core_check_feature(dev, DRIVER_LEGACY))) {
> > > > > +		if (!dev->irq_enabled)
> > > > > +			return -EOPNOTSUPP;
> > > > > +	} else /* if DRIVER_MODESET */
> > > > > +#endif
> > > > > +	{
> > > > > +		if (!drm_dev_has_vblank(dev))
> > > > > +			return -EOPNOTSUPP;
> > > > > +	}
> > > > 
> > > > Sheesh I hate this kind of inline #ifdefs.
> > > > 
> > > > Two alternate suggestions that I believe should be as just efficient:
> > > 
> > > Or how about:
> > > 
> > > static bool drm_wait_vblank_supported(struct drm_device *dev)
> > > 
> > > {
> > > 
> > > if defined(CONFIG_DRM_LEGACY)
> > > 	if  (unlikely(drm_core_check_feature(dev, DRIVER_LEGACY)))
> > > 
> > > 		return dev->irq_enabled;
> > > 
> > > #endif
> > > 	return drm_dev_has_vblank(dev);
> > > 
> > > }
> > > 
> > > 
> > > ?
> > > 
> > > It's inline, but still readable.
> > 
> > It's definitely better than the original, but it's unclear to me why
> > you'd prefer this over option 2) below. I guess the only reason I can
> > think of is emphasizing the conditional compilation. However,
> > IS_ENABLED() is widely used in this manner specifically to avoid inline
> > #if, and the compiler optimizes it away.
> 
> It's simply more readable to me as the condition is simpler. But option 2 is
> also ok.

Either option looks good to me.

Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>

Thanks for doing that!
Liviu

> 
> Best regards
> Thomas
> 
> > 
> > BR,
> > Jani.
> > 
> > 
> > > 
> > > Best regards
> > > Thomas
> > > 
> > > > 
> > > > 1) The more verbose:
> > > > 
> > > > #if defined(CONFIG_DRM_LEGACY)
> > > > static bool drm_wait_vblank_supported(struct drm_device *dev)
> > > > {
> > > > 	if  (unlikely(drm_core_check_feature(dev, DRIVER_LEGACY)))
> > > > 		return dev->irq_enabled;
> > > > 	else
> > > > 		return drm_dev_has_vblank(dev);
> > > > }
> > > > #else
> > > > static bool drm_wait_vblank_supported(struct drm_device *dev)
> > > > {
> > > > 	return drm_dev_has_vblank(dev);
> > > > }
> > > > #endif
> > > > 
> > > > 2) The more compact:
> > > > 
> > > > static bool drm_wait_vblank_supported(struct drm_device *dev)
> > > > {
> > > > 	if  (IS_ENABLED(CONFIG_DRM_LEGACY) && unlikely(drm_core_check_feature(dev, DRIVER_LEGACY)))
> > > > 		return dev->irq_enabled;
> > > > 	else
> > > > 		return drm_dev_has_vblank(dev);
> > > > }
> > > > 
> > > > Then, in drm_wait_vblank_ioctl().
> > > > 
> > > > 	if (!drm_wait_vblank_supported(dev))
> > > > 		return -EOPNOTSUPP;
> > > > 
> > > > The compiler should do the right thing without any explicit inline
> > > > keywords etc.
> > > > 
> > > > BR,
> > > > Jani.
> > > > 
> > > > >    	if (vblwait->request.type & _DRM_VBLANK_SIGNAL)
> > > > >    		return -EINVAL;
> > > > > @@ -2023,7 +2031,7 @@ int drm_crtc_get_sequence_ioctl(struct drm_device *dev, void *data,
> > > > >    	if (!drm_core_check_feature(dev, DRIVER_MODESET))
> > > > >    		return -EOPNOTSUPP;
> > > > > -	if (!dev->irq_enabled)
> > > > > +	if (!drm_dev_has_vblank(dev))
> > > > >    		return -EOPNOTSUPP;
> > > > >    	crtc = drm_crtc_find(dev, file_priv, get_seq->crtc_id);
> > > > > @@ -2082,7 +2090,7 @@ int drm_crtc_queue_sequence_ioctl(struct drm_device *dev, void *data,
> > > > >    	if (!drm_core_check_feature(dev, DRIVER_MODESET))
> > > > >    		return -EOPNOTSUPP;
> > > > > -	if (!dev->irq_enabled)
> > > > > +	if (!drm_dev_has_vblank(dev))
> > > > >    		return -EOPNOTSUPP;
> > > > >    	crtc = drm_crtc_find(dev, file_priv, queue_seq->crtc_id);
> > > > 
> > 
> 
> -- 
> Thomas Zimmermann
> Graphics Driver Developer
> SUSE Software Solutions Germany GmbH
> Maxfeldstr. 5, 90409 Nürnberg, Germany
> (HRB 36809, AG Nürnberg)
> Geschäftsführer: Felix Imendörffer
> 




-- 
====================
| I would like to |
| fix the world,  |
| but they're not |
| giving me the   |
 \ source code!  /
  ---------------
    ¯\_(ツ)_/¯
