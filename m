Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 76B746B9AAB
	for <lists+linux-samsung-soc@lfdr.de>; Tue, 14 Mar 2023 17:06:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229722AbjCNQGU (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Tue, 14 Mar 2023 12:06:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51458 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229690AbjCNQGS (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 14 Mar 2023 12:06:18 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E65FF9544E
        for <linux-samsung-soc@vger.kernel.org>; Tue, 14 Mar 2023 09:05:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1678809913;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=dGR7rnzQU4+OplsWaATHZ55m61w54EhaATkQ2WBXuU8=;
        b=e4I8Stp6kv6kcYNN4iejf/hOkk3tY+d9S5WxGJfbJYoN+3/53asKNeXMXXJRzzdkMjAioM
        VZzDnqWIGgO8iSfQ4u2JhVi52h0mZLOyQyrl+iJs2WhK+Haq8y/yeD4lIbrgWvLI+ziP4U
        fuBBNlLNU0jGZKa34cuby8D0k/obQoQ=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-611-nodZcTfMNRmHqkqXiYlyOQ-1; Tue, 14 Mar 2023 12:05:09 -0400
X-MC-Unique: nodZcTfMNRmHqkqXiYlyOQ-1
Received: by mail-wm1-f69.google.com with SMTP id n18-20020a05600c501200b003ed24740ea4so3166024wmr.3
        for <linux-samsung-soc@vger.kernel.org>; Tue, 14 Mar 2023 09:05:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678809907;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dGR7rnzQU4+OplsWaATHZ55m61w54EhaATkQ2WBXuU8=;
        b=DaAC2JfVyQRIKqYD0AxssI1cjQHVmWHG2mbK5jBeQQjbPOBsoOlPvsV0Tl9Qr00xfF
         ho3dZD09BSN0W3MXKxhOPYldU+o0z1vNpf9+hoVd2z0QeDosJ2bwrDwsu9eUSphe3cbj
         gr7sQHIXopITnbYSghS817vA775ploMXC89MXQ/Di6dNIapaVZRtXyWVgiNkmXKH34mK
         mv1RUlxNPD5VFIBi08qlrDOjmM879UVGewi0yW6otDZsCfPg31TbN19m1Bo8Fw3OC2GL
         4o7hl2oZXjVLjZzUSU98ISLOQJr13kjmuQdCdKuUrKGjttHSLN/IoJTo4BEefVMi8Xzy
         oNbA==
X-Gm-Message-State: AO0yUKU034jp3v9VGldsDcL/qRNzeZ5cEz18/rbQTuNwraI0ANhkV5ok
        2dLxGCUEMlsX+zBQrYpVwVFSWxEnQFl3flLUNTl5WsaezhNsb9i4qOaNccKxyQkJGmiYVxU2sYD
        90oLrYkg8bbuAsorH9pAIz1sx0UppxyA=
X-Received: by 2002:a05:600c:4f91:b0:3ed:2c92:9f4f with SMTP id n17-20020a05600c4f9100b003ed2c929f4fmr2497187wmq.10.1678809907238;
        Tue, 14 Mar 2023 09:05:07 -0700 (PDT)
X-Google-Smtp-Source: AK7set9xSEo7gCICSkLAf2zsB02OWfCkjdy+yaejHZtyJwi5t5dZZAehVmN38jPmBozEi8lyKugTiQ==
X-Received: by 2002:a05:600c:4f91:b0:3ed:2c92:9f4f with SMTP id n17-20020a05600c4f9100b003ed2c929f4fmr2497152wmq.10.1678809906889;
        Tue, 14 Mar 2023 09:05:06 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id t18-20020a1c7712000000b003ed2987690dsm3148966wmi.26.2023.03.14.09.05.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Mar 2023 09:05:06 -0700 (PDT)
From:   Javier Martinez Canillas <javierm@redhat.com>
To:     Philipp Zabel <p.zabel@pengutronix.de>,
        Uwe =?utf-8?Q?Kleine-K=C3=B6ni?= =?utf-8?Q?g?= 
        <u.kleine-koenig@pengutronix.de>, Arnd Bergmann <arnd@arndb.de>,
        Inki Dae <inki.dae@samsung.com>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Tomi Valkeinen <tomba@kernel.org>,
        Alain Volmat <alain.volmat@foss.st.com>,
        Yannick Fertre <yannick.fertre@foss.st.com>,
        Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>,
        Philippe Cornu <philippe.cornu@foss.st.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc:     linux-samsung-soc@vger.kernel.org,
        Alim Akhtar <alim.akhtar@samsung.com>,
        dri-devel@lists.freedesktop.org,
        NXP Linux Team <linux-imx@nxp.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] drm: Drop ARCH_MULTIPLATFORM from dependencies
In-Reply-To: <bbd54405501ec660ac941971e2203855fd79a90f.camel@pengutronix.de>
References: <20221209220555.3631364-1-u.kleine-koenig@pengutronix.de>
 <bbd54405501ec660ac941971e2203855fd79a90f.camel@pengutronix.de>
Date:   Tue, 14 Mar 2023 17:05:04 +0100
Message-ID: <87ilf3l3nz.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Philipp Zabel <p.zabel@pengutronix.de> writes:

> On Fr, 2022-12-09 at 23:05 +0100, Uwe Kleine-K=C3=B6nig wrote:
>> Some of these dependencies used to be sensible when only a small part of
>> the platforms supported by ARCH=3Darm could be compiled together in a
>> single kernel image. Nowadays ARCH_MULTIPLATFORM is only used as a guard
>> for kernel options incompatible with a multiplatform image. See commit
>> 84fc86360623 ("ARM: make ARCH_MULTIPLATFORM user-visible") for some more
>> details.
>>=20
>> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
>> ---
>> =C2=A0drivers/gpu/drm/imx/Kconfig     | 2 +-
>> =C2=A0drivers/gpu/ipu-v3/Kconfig      | 2 +-
>
> For i.MX / IPUv3,
>
> Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
>

Pushed to drm-misc (drm-misc-next). Thanks!

--=20
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

