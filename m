Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D038F27E38D
	for <lists+linux-samsung-soc@lfdr.de>; Wed, 30 Sep 2020 10:19:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725776AbgI3ITK (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Wed, 30 Sep 2020 04:19:10 -0400
Received: from mx2.suse.de ([195.135.220.15]:54820 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725535AbgI3ITK (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 30 Sep 2020 04:19:10 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id E8D94AB0E
        for <linux-samsung-soc@vger.kernel.org>; Wed, 30 Sep 2020 08:19:07 +0000 (UTC)
Subject: Re: [PATCH v3 2/7] drm/ttm: Add ttm_kmap_obj_to_dma_buf_map() for
 type conversion
To:     christian.koenig@amd.com, maarten.lankhorst@linux.intel.com,
        mripard@kernel.org, airlied@linux.ie, daniel@ffwll.ch,
        sam@ravnborg.org, alexander.deucher@amd.com, kraxel@redhat.com,
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
        chris@chris-wilson.co.uk, miaoqinglang@huawei.com
Cc:     linux-samsung-soc@vger.kernel.org, lima@lists.freedesktop.org,
        nouveau@lists.freedesktop.org, etnaviv@lists.freedesktop.org,
        amd-gfx@lists.freedesktop.org,
        virtualization@lists.linux-foundation.org,
        linaro-mm-sig@lists.linaro.org, linux-rockchip@lists.infradead.org,
        dri-devel@lists.freedesktop.org, xen-devel@lists.xenproject.org,
        spice-devel@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
References: <20200929151437.19717-1-tzimmermann@suse.de>
 <20200929151437.19717-3-tzimmermann@suse.de>
 <8fad0114-064a-4ed5-c21d-d1b4294de0a1@amd.com>
 <2614314a-81f7-4722-c400-68d90e48e09a@suse.de>
 <8a84f62b-33f3-f44c-52af-c859a0e0d1fb@gmail.com>
From:   Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <07972ada-9135-3743-a86b-487f610c509f@suse.de>
Date:   Wed, 30 Sep 2020 10:19:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <8a84f62b-33f3-f44c-52af-c859a0e0d1fb@gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="2tnNmM6Gncu4Z9HVjsD6XejU6DShIRxes"
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--2tnNmM6Gncu4Z9HVjsD6XejU6DShIRxes
Content-Type: multipart/mixed; boundary="8reR6qmzfsBdHGMj2V1Scdvi6KHFIuvgk";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: christian.koenig@amd.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, airlied@linux.ie, daniel@ffwll.ch, sam@ravnborg.org,
 alexander.deucher@amd.com, kraxel@redhat.com, l.stach@pengutronix.de,
 linux+etnaviv@armlinux.org.uk, christian.gmeiner@gmail.com,
 inki.dae@samsung.com, jy0922.shim@samsung.com, sw0312.kim@samsung.com,
 kyungmin.park@samsung.com, kgene@kernel.org, krzk@kernel.org,
 yuq825@gmail.com, bskeggs@redhat.com, robh@kernel.org,
 tomeu.vizoso@collabora.com, steven.price@arm.com,
 alyssa.rosenzweig@collabora.com, hjc@rock-chips.com, heiko@sntech.de,
 hdegoede@redhat.com, sean@poorly.run, eric@anholt.net,
 oleksandr_andrushchenko@epam.com, ray.huang@amd.com,
 sumit.semwal@linaro.org, emil.velikov@collabora.com, luben.tuikov@amd.com,
 apaneers@amd.com, linus.walleij@linaro.org, melissa.srw@gmail.com,
 chris@chris-wilson.co.uk, miaoqinglang@huawei.com
Cc: linux-samsung-soc@vger.kernel.org, lima@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, etnaviv@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 linaro-mm-sig@lists.linaro.org, linux-rockchip@lists.infradead.org,
 dri-devel@lists.freedesktop.org, xen-devel@lists.xenproject.org,
 spice-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Message-ID: <07972ada-9135-3743-a86b-487f610c509f@suse.de>
Subject: Re: [PATCH v3 2/7] drm/ttm: Add ttm_kmap_obj_to_dma_buf_map() for
 type conversion
References: <20200929151437.19717-1-tzimmermann@suse.de>
 <20200929151437.19717-3-tzimmermann@suse.de>
 <8fad0114-064a-4ed5-c21d-d1b4294de0a1@amd.com>
 <2614314a-81f7-4722-c400-68d90e48e09a@suse.de>
 <8a84f62b-33f3-f44c-52af-c859a0e0d1fb@gmail.com>
In-Reply-To: <8a84f62b-33f3-f44c-52af-c859a0e0d1fb@gmail.com>

--8reR6qmzfsBdHGMj2V1Scdvi6KHFIuvgk
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 30.09.20 um 10:05 schrieb Christian K=C3=B6nig:
> Am 29.09.20 um 19:49 schrieb Thomas Zimmermann:
>> Hi Christian
>>
>> Am 29.09.20 um 17:35 schrieb Christian K=C3=B6nig:
>>> Am 29.09.20 um 17:14 schrieb Thomas Zimmermann:
>>>> The new helper ttm_kmap_obj_to_dma_buf() extracts address and locati=
on
>>>> from and instance of TTM's kmap_obj and initializes struct dma_buf_m=
ap
>>>> with these values. Helpful for TTM-based drivers.
>>> We could completely drop that if we use the same structure inside TTM=
 as
>>> well.
>>>
>>> Additional to that which driver is going to use this?
>> As Daniel mentioned, it's in patch 3. The TTM-based drivers will
>> retrieve the pointer via this function.
>>
>> I do want to see all that being more tightly integrated into TTM, but
>> not in this series. This one is about fixing the bochs-on-sparc64
>> problem for good. Patch 7 adds an update to TTM to the DRM TODO list.
>=20
> I should have asked which driver you try to fix here :)
>=20
> In this case just keep the function inside bochs and only fix it there.=

>=20
> All other drivers can be fixed when we generally pump this through TTM.=


Did you take a look at patch 3? This function will be used by VRAM
helpers, nouveau, radeon, amdgpu and qxl. If we don't put it here, we
have to duplicate the functionality in each if these drivers. Bochs
itself uses VRAM helpers and doesn't touch the function directly.

Best regards
Thomas

>=20
> Regards,
> Christian.
>=20
>> Best regards
>> Thomas
>>
>>> Regards,
>>> Christian.
>>>
>>>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>>>> ---
>>>> =C2=A0 include/drm/ttm/ttm_bo_api.h | 24 ++++++++++++++++++++++++
>>>> =C2=A0 include/linux/dma-buf-map.h=C2=A0 | 20 ++++++++++++++++++++
>>>> =C2=A0 2 files changed, 44 insertions(+)
>>>>
>>>> diff --git a/include/drm/ttm/ttm_bo_api.h b/include/drm/ttm/ttm_bo_a=
pi.h
>>>> index c96a25d571c8..62d89f05a801 100644
>>>> --- a/include/drm/ttm/ttm_bo_api.h
>>>> +++ b/include/drm/ttm/ttm_bo_api.h
>>>> @@ -34,6 +34,7 @@
>>>> =C2=A0 #include <drm/drm_gem.h>
>>>> =C2=A0 #include <drm/drm_hashtab.h>
>>>> =C2=A0 #include <drm/drm_vma_manager.h>
>>>> +#include <linux/dma-buf-map.h>
>>>> =C2=A0 #include <linux/kref.h>
>>>> =C2=A0 #include <linux/list.h>
>>>> =C2=A0 #include <linux/wait.h>
>>>> @@ -486,6 +487,29 @@ static inline void *ttm_kmap_obj_virtual(struct=

>>>> ttm_bo_kmap_obj *map,
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return map->virtual;
>>>> =C2=A0 }
>>>> =C2=A0 +/**
>>>> + * ttm_kmap_obj_to_dma_buf_map
>>>> + *
>>>> + * @kmap: A struct ttm_bo_kmap_obj returned from ttm_bo_kmap.
>>>> + * @map: Returns the mapping as struct dma_buf_map
>>>> + *
>>>> + * Converts struct ttm_bo_kmap_obj to struct dma_buf_map. If the me=
mory
>>>> + * is not mapped, the returned mapping is initialized to NULL.
>>>> + */
>>>> +static inline void ttm_kmap_obj_to_dma_buf_map(struct ttm_bo_kmap_o=
bj
>>>> *kmap,
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 struct dma_buf_map *map)
>>>> +{
>>>> +=C2=A0=C2=A0=C2=A0 bool is_iomem;
>>>> +=C2=A0=C2=A0=C2=A0 void *vaddr =3D ttm_kmap_obj_virtual(kmap, &is_i=
omem);
>>>> +
>>>> +=C2=A0=C2=A0=C2=A0 if (!vaddr)
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dma_buf_map_clear(map);
>>>> +=C2=A0=C2=A0=C2=A0 else if (is_iomem)
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dma_buf_map_set_vaddr_io=
mem(map, (void __force __iomem *)vaddr);
>>>> +=C2=A0=C2=A0=C2=A0 else
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dma_buf_map_set_vaddr(ma=
p, vaddr);
>>>> +}
>>>> +
>>>> =C2=A0 /**
>>>> =C2=A0=C2=A0 * ttm_bo_kmap
>>>> =C2=A0=C2=A0 *
>>>> diff --git a/include/linux/dma-buf-map.h b/include/linux/dma-buf-map=
=2Eh
>>>> index fd1aba545fdf..2e8bbecb5091 100644
>>>> --- a/include/linux/dma-buf-map.h
>>>> +++ b/include/linux/dma-buf-map.h
>>>> @@ -45,6 +45,12 @@
>>>> =C2=A0=C2=A0 *
>>>> =C2=A0=C2=A0 *=C2=A0=C2=A0=C2=A0 dma_buf_map_set_vaddr(&map. 0xdeadb=
eaf);
>>>> =C2=A0=C2=A0 *
>>>> + * To set an address in I/O memory, use dma_buf_map_set_vaddr_iomem=
().
>>>> + *
>>>> + * .. code-block:: c
>>>> + *
>>>> + *=C2=A0=C2=A0=C2=A0 dma_buf_map_set_vaddr_iomem(&map. 0xdeadbeaf);=

>>>> + *
>>>> =C2=A0=C2=A0 * Test if a mapping is valid with either dma_buf_map_is=
_set() or
>>>> =C2=A0=C2=A0 * dma_buf_map_is_null().
>>>> =C2=A0=C2=A0 *
>>>> @@ -118,6 +124,20 @@ static inline void dma_buf_map_set_vaddr(struct=

>>>> dma_buf_map *map, void *vaddr)
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 map->is_iomem =3D false;
>>>> =C2=A0 }
>>>> =C2=A0 +/**
>>>> + * dma_buf_map_set_vaddr_iomem - Sets a dma-buf mapping structure t=
o
>>>> an address in I/O memory
>>>> + * @map:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 The dma-buf mapp=
ing structure
>>>> + * @vaddr_iomem:=C2=A0=C2=A0=C2=A0 An I/O-memory address
>>>> + *
>>>> + * Sets the address and the I/O-memory flag.
>>>> + */
>>>> +static inline void dma_buf_map_set_vaddr_iomem(struct dma_buf_map *=
map,
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 void __iomem *vaddr_iomem)
>>>> +{
>>>> +=C2=A0=C2=A0=C2=A0 map->vaddr_iomem =3D vaddr_iomem;
>>>> +=C2=A0=C2=A0=C2=A0 map->is_iomem =3D true;
>>>> +}
>>>> +
>>>> =C2=A0 /**
>>>> =C2=A0=C2=A0 * dma_buf_map_is_equal - Compares two dma-buf mapping s=
tructures
>>>> for equality
>>>> =C2=A0=C2=A0 * @lhs:=C2=A0=C2=A0=C2=A0 The dma-buf mapping structure=

>>> _______________________________________________
>>> dri-devel mailing list
>>> dri-devel@lists.freedesktop.org
>>> https://lists.freedesktop.org/mailman/listinfo/dri-devel
>>
>> _______________________________________________
>> amd-gfx mailing list
>> amd-gfx@lists.freedesktop.org
>> https://lists.freedesktop.org/mailman/listinfo/amd-gfx
>=20
>=20
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--8reR6qmzfsBdHGMj2V1Scdvi6KHFIuvgk--

--2tnNmM6Gncu4Z9HVjsD6XejU6DShIRxes
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQFIBAEBCAAyFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl90P3oUHHR6aW1tZXJt
YW5uQHN1c2UuZGUACgkQaA3BHVMLeiOhVQf/Yv+6gFInXQVuqEi1ESWHgMw3t7Q2
cnUg/6thxYVeLkIYdhhbnWBJbHFuwrDriJIad46Ptb3IeoigYaKbFF3ugYhvPkyl
Z9cLTYI023ZIe5VDgdIavfx82kfG2SYDn95MF4he62lWk+Wqf0sTr2ZtSmX5qoec
0fkWrJu3aTwroDjJoUIfrysvpX0px5Oyee+wVT7pZgcL59ltLz+GTDWVJqLePjS3
q8gRTYBP118NUnDY7V7GsUTg6VXUJf+IwYIO3GIhcq8tw835SzJx9wzOKQ7zVXxF
X8+of5BnSn43BGnzP9KkXwoVR647nGNPwin8wqtDISLp1MjHvRP1sc3pWg==
=0pMc
-----END PGP SIGNATURE-----

--2tnNmM6Gncu4Z9HVjsD6XejU6DShIRxes--
