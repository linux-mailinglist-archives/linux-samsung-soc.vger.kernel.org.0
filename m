Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AB52D27E58B
	for <lists+linux-samsung-soc@lfdr.de>; Wed, 30 Sep 2020 11:47:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728655AbgI3JrT (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Wed, 30 Sep 2020 05:47:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46036 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728974AbgI3JrS (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 30 Sep 2020 05:47:18 -0400
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D386FC061755
        for <linux-samsung-soc@vger.kernel.org>; Wed, 30 Sep 2020 02:47:17 -0700 (PDT)
Received: by mail-wm1-x341.google.com with SMTP id e17so985905wme.0
        for <linux-samsung-soc@vger.kernel.org>; Wed, 30 Sep 2020 02:47:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=mk/10QMoJ+o57Gs0uKBi5jqLBb5COb+Y9kF4IXUlM/Q=;
        b=YslZyjVoOldROC3jA1fPKGoa2j+xP9ZMNK4SZUeZjFZmxDgc83XfrocubX8z+Ghi0i
         mxxZbyYhvNo/yzlGV7M9TYWiI6ebmWI5MPFUrLdFH5HEq/1glgvLqigSOT2sZCqvNTzQ
         5j2dQDwMw2raEHsSORmptJcNQAmWyQj8NQX/A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=mk/10QMoJ+o57Gs0uKBi5jqLBb5COb+Y9kF4IXUlM/Q=;
        b=CdiDwRwJG7Xh7zN8uz8zSuleTN0+3FybW2gzn8EHbdfYGD2D/EuwwR4+Z58iPyypVz
         +Ln82RxmHe+PKA6CJPzHU17VGk64fdtuo29nWuyESglr382WgcPob8RfKjaKWtGQoTHV
         pYIBptFYm322INGrBKElBJsSxW937UxSncKHBlriEWosinhLLqTBjTX87pkZ/8F+eMdS
         jK9gXQPR6ezI0kUNxkNvL4xzPAsvs46I1IvHIcZo8oxWOeuytmOaJYV/39R42wG9DEhr
         UpZeOH+f8Qrf3L70MfTdVvNmludndRI593Uitj+K9lMH6bQAVGatmpHele/+fMGl05E5
         K1Nw==
X-Gm-Message-State: AOAM531z4IjkGkwYJLObM2b0nF8cuiV7zqw4cjSZObYmntbWKBYye1HE
        yvWKRyEpIDRj+cszjBM85Hu7GQ==
X-Google-Smtp-Source: ABdhPJy8QqpQoBX6MWQ3S7YZuW9WMNYB4GRIEped2k61Hp3lacYf00Zpjbck3DpWjhDxW2rcxoc68Q==
X-Received: by 2002:a1c:98d8:: with SMTP id a207mr1952908wme.157.1601459236371;
        Wed, 30 Sep 2020 02:47:16 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id n6sm1769842wmd.22.2020.09.30.02.47.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2020 02:47:15 -0700 (PDT)
Date:   Wed, 30 Sep 2020 11:47:12 +0200
From:   Daniel Vetter <daniel@ffwll.ch>
To:     christian.koenig@amd.com
Cc:     Thomas Zimmermann <tzimmermann@suse.de>,
        maarten.lankhorst@linux.intel.com, mripard@kernel.org,
        airlied@linux.ie, daniel@ffwll.ch, sam@ravnborg.org,
        alexander.deucher@amd.com, kraxel@redhat.com,
        l.stach@pengutronix.de, linux+etnaviv@armlinux.org.uk,
        christian.gmeiner@gmail.com, inki.dae@samsung.com,
        jy0922.shim@samsung.com, sw0312.kim@samsung.com,
        kyungmin.park@samsung.com, kgene@kernel.org, krzk@kernel.org,
        yuq825@gmail.com, bskeggs@redhat.com, robh@kernel.org,
        tomeu.vizoso@collabora.com, steven.price@arm.com,
        alyssa.rosenzweig@collabora.com, hjc@rock-chips.com,
        heiko@sntech.de, hdegoede@redhat.com, sean@poorly.run,
        eric@anholt.net, oleksandr_andrushchenko@epam.com,
        ray.huang@amd.com, sumit.semwal@linaro.org,
        emil.velikov@collabora.com, luben.tuikov@amd.com, apaneers@amd.com,
        linus.walleij@linaro.org, melissa.srw@gmail.com,
        chris@chris-wilson.co.uk, miaoqinglang@huawei.com,
        linux-samsung-soc@vger.kernel.org, lima@lists.freedesktop.org,
        nouveau@lists.freedesktop.org, etnaviv@lists.freedesktop.org,
        amd-gfx@lists.freedesktop.org,
        virtualization@lists.linux-foundation.org,
        linaro-mm-sig@lists.linaro.org, linux-rockchip@lists.infradead.org,
        dri-devel@lists.freedesktop.org, spice-devel@lists.freedesktop.org,
        xen-devel@lists.xenproject.org,
        linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Subject: Re: [PATCH v3 2/7] drm/ttm: Add ttm_kmap_obj_to_dma_buf_map() for
 type conversion
Message-ID: <20200930094712.GW438822@phenom.ffwll.local>
References: <20200929151437.19717-1-tzimmermann@suse.de>
 <20200929151437.19717-3-tzimmermann@suse.de>
 <8fad0114-064a-4ed5-c21d-d1b4294de0a1@amd.com>
 <2614314a-81f7-4722-c400-68d90e48e09a@suse.de>
 <8a84f62b-33f3-f44c-52af-c859a0e0d1fb@gmail.com>
 <07972ada-9135-3743-a86b-487f610c509f@suse.de>
 <b569b7e3-68f0-edcc-c8f4-170e9042d348@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b569b7e3-68f0-edcc-c8f4-170e9042d348@gmail.com>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Wed, Sep 30, 2020 at 10:34:31AM +0200, Christian K�nig wrote:
> Am 30.09.20 um 10:19 schrieb Thomas Zimmermann:
> > Hi
> > 
> > Am 30.09.20 um 10:05 schrieb Christian K�nig:
> > > Am 29.09.20 um 19:49 schrieb Thomas Zimmermann:
> > > > Hi Christian
> > > > 
> > > > Am 29.09.20 um 17:35 schrieb Christian K�nig:
> > > > > Am 29.09.20 um 17:14 schrieb Thomas Zimmermann:
> > > > > > The new helper ttm_kmap_obj_to_dma_buf() extracts address and location
> > > > > > from and instance of TTM's kmap_obj and initializes struct dma_buf_map
> > > > > > with these values. Helpful for TTM-based drivers.
> > > > > We could completely drop that if we use the same structure inside TTM as
> > > > > well.
> > > > > 
> > > > > Additional to that which driver is going to use this?
> > > > As Daniel mentioned, it's in patch 3. The TTM-based drivers will
> > > > retrieve the pointer via this function.
> > > > 
> > > > I do want to see all that being more tightly integrated into TTM, but
> > > > not in this series. This one is about fixing the bochs-on-sparc64
> > > > problem for good. Patch 7 adds an update to TTM to the DRM TODO list.
> > > I should have asked which driver you try to fix here :)
> > > 
> > > In this case just keep the function inside bochs and only fix it there.
> > > 
> > > All other drivers can be fixed when we generally pump this through TTM.
> > Did you take a look at patch 3? This function will be used by VRAM
> > helpers, nouveau, radeon, amdgpu and qxl. If we don't put it here, we
> > have to duplicate the functionality in each if these drivers. Bochs
> > itself uses VRAM helpers and doesn't touch the function directly.
> 
> Ah, ok can we have that then only in the VRAM helpers?
> 
> Alternative you could go ahead and use dma_buf_map in ttm_bo_kmap_obj
> directly and drop the hack with the TTM_BO_MAP_IOMEM_MASK.
> 
> What I want to avoid is to have another conversion function in TTM because
> what happens here is that we already convert from ttm_bus_placement to
> ttm_bo_kmap_obj and then to dma_buf_map.

Hm I'm not really seeing how that helps with a gradual conversion of
everything over to dma_buf_map and assorted helpers for access? There's
too many places in ttm drivers where is_iomem and related stuff is used to
be able to convert it all in one go. An intermediate state with a bunch of
conversions seems fairly unavoidable to me.
-Daniel

> 
> Thanks,
> Christian.
> 
> > 
> > Best regards
> > Thomas
> > 
> > > Regards,
> > > Christian.
> > > 
> > > > Best regards
> > > > Thomas
> > > > 
> > > > > Regards,
> > > > > Christian.
> > > > > 
> > > > > > Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> > > > > > ---
> > > > > >  � include/drm/ttm/ttm_bo_api.h | 24 ++++++++++++++++++++++++
> > > > > >  � include/linux/dma-buf-map.h� | 20 ++++++++++++++++++++
> > > > > >  � 2 files changed, 44 insertions(+)
> > > > > > 
> > > > > > diff --git a/include/drm/ttm/ttm_bo_api.h b/include/drm/ttm/ttm_bo_api.h
> > > > > > index c96a25d571c8..62d89f05a801 100644
> > > > > > --- a/include/drm/ttm/ttm_bo_api.h
> > > > > > +++ b/include/drm/ttm/ttm_bo_api.h
> > > > > > @@ -34,6 +34,7 @@
> > > > > >  � #include <drm/drm_gem.h>
> > > > > >  � #include <drm/drm_hashtab.h>
> > > > > >  � #include <drm/drm_vma_manager.h>
> > > > > > +#include <linux/dma-buf-map.h>
> > > > > >  � #include <linux/kref.h>
> > > > > >  � #include <linux/list.h>
> > > > > >  � #include <linux/wait.h>
> > > > > > @@ -486,6 +487,29 @@ static inline void *ttm_kmap_obj_virtual(struct
> > > > > > ttm_bo_kmap_obj *map,
> > > > > >  ����� return map->virtual;
> > > > > >  � }
> > > > > >  � +/**
> > > > > > + * ttm_kmap_obj_to_dma_buf_map
> > > > > > + *
> > > > > > + * @kmap: A struct ttm_bo_kmap_obj returned from ttm_bo_kmap.
> > > > > > + * @map: Returns the mapping as struct dma_buf_map
> > > > > > + *
> > > > > > + * Converts struct ttm_bo_kmap_obj to struct dma_buf_map. If the memory
> > > > > > + * is not mapped, the returned mapping is initialized to NULL.
> > > > > > + */
> > > > > > +static inline void ttm_kmap_obj_to_dma_buf_map(struct ttm_bo_kmap_obj
> > > > > > *kmap,
> > > > > > +�������������������������� struct dma_buf_map *map)
> > > > > > +{
> > > > > > +��� bool is_iomem;
> > > > > > +��� void *vaddr = ttm_kmap_obj_virtual(kmap, &is_iomem);
> > > > > > +
> > > > > > +��� if (!vaddr)
> > > > > > +������� dma_buf_map_clear(map);
> > > > > > +��� else if (is_iomem)
> > > > > > +������� dma_buf_map_set_vaddr_iomem(map, (void __force __iomem *)vaddr);
> > > > > > +��� else
> > > > > > +������� dma_buf_map_set_vaddr(map, vaddr);
> > > > > > +}
> > > > > > +
> > > > > >  � /**
> > > > > >  �� * ttm_bo_kmap
> > > > > >  �� *
> > > > > > diff --git a/include/linux/dma-buf-map.h b/include/linux/dma-buf-map.h
> > > > > > index fd1aba545fdf..2e8bbecb5091 100644
> > > > > > --- a/include/linux/dma-buf-map.h
> > > > > > +++ b/include/linux/dma-buf-map.h
> > > > > > @@ -45,6 +45,12 @@
> > > > > >  �� *
> > > > > >  �� *��� dma_buf_map_set_vaddr(&map. 0xdeadbeaf);
> > > > > >  �� *
> > > > > > + * To set an address in I/O memory, use dma_buf_map_set_vaddr_iomem().
> > > > > > + *
> > > > > > + * .. code-block:: c
> > > > > > + *
> > > > > > + *��� dma_buf_map_set_vaddr_iomem(&map. 0xdeadbeaf);
> > > > > > + *
> > > > > >  �� * Test if a mapping is valid with either dma_buf_map_is_set() or
> > > > > >  �� * dma_buf_map_is_null().
> > > > > >  �� *
> > > > > > @@ -118,6 +124,20 @@ static inline void dma_buf_map_set_vaddr(struct
> > > > > > dma_buf_map *map, void *vaddr)
> > > > > >  ����� map->is_iomem = false;
> > > > > >  � }
> > > > > >  � +/**
> > > > > > + * dma_buf_map_set_vaddr_iomem - Sets a dma-buf mapping structure to
> > > > > > an address in I/O memory
> > > > > > + * @map:������� The dma-buf mapping structure
> > > > > > + * @vaddr_iomem:��� An I/O-memory address
> > > > > > + *
> > > > > > + * Sets the address and the I/O-memory flag.
> > > > > > + */
> > > > > > +static inline void dma_buf_map_set_vaddr_iomem(struct dma_buf_map *map,
> > > > > > +�������������������������� void __iomem *vaddr_iomem)
> > > > > > +{
> > > > > > +��� map->vaddr_iomem = vaddr_iomem;
> > > > > > +��� map->is_iomem = true;
> > > > > > +}
> > > > > > +
> > > > > >  � /**
> > > > > >  �� * dma_buf_map_is_equal - Compares two dma-buf mapping structures
> > > > > > for equality
> > > > > >  �� * @lhs:��� The dma-buf mapping structure
> > > > > _______________________________________________
> > > > > dri-devel mailing list
> > > > > dri-devel@lists.freedesktop.org
> > > > > https://lists.freedesktop.org/mailman/listinfo/dri-devel
> > > > _______________________________________________
> > > > amd-gfx mailing list
> > > > amd-gfx@lists.freedesktop.org
> > > > https://lists.freedesktop.org/mailman/listinfo/amd-gfx
> > > 
> > > _______________________________________________
> > > dri-devel mailing list
> > > dri-devel@lists.freedesktop.org
> > > https://lists.freedesktop.org/mailman/listinfo/dri-devel
> > > 
> > 
> > _______________________________________________
> > amd-gfx mailing list
> > amd-gfx@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/amd-gfx
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
