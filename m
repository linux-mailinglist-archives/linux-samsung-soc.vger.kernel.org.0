Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F17927480F1
	for <lists+linux-samsung-soc@lfdr.de>; Wed,  5 Jul 2023 11:35:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231152AbjGEJfQ (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Wed, 5 Jul 2023 05:35:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51472 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231614AbjGEJfP (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 5 Jul 2023 05:35:15 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4DF11719
        for <linux-samsung-soc@vger.kernel.org>; Wed,  5 Jul 2023 02:34:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1688549669;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=2l0oWn80w44VFK/52z7+jyoTd7jTP9Axkcdy88qxz40=;
        b=Zu88lZ0XHkNjZtSSq/MId8+8oXq67YdE6bujPC3gLxrAC49UdcK7UNZmjXN2l2REJ8cPSv
        6aO+UBIWP4jwAxtHHqMrj4Ss26EdqNZA6YRz3fpGMaYBcL5t5RFQL5mgozGHYo3or6GoDi
        eUId6WDNkX5dAsieV4m96nFoNBmmC8U=
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com
 [209.85.167.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-439-6ctn-P0KOFq0eZu3r4IN3Q-1; Wed, 05 Jul 2023 05:34:28 -0400
X-MC-Unique: 6ctn-P0KOFq0eZu3r4IN3Q-1
Received: by mail-lf1-f69.google.com with SMTP id 2adb3069b0e04-4f84a8b00e3so6274837e87.0
        for <linux-samsung-soc@vger.kernel.org>; Wed, 05 Jul 2023 02:34:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688549667; x=1691141667;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2l0oWn80w44VFK/52z7+jyoTd7jTP9Axkcdy88qxz40=;
        b=XlwLZYrbocI2dVTmzLRDhQD4nqpOcNpldb4liAK/a1cvHESjNP+LCp8EVknV2+ToBX
         mym8c1UJdZd3maTU2FFmmOZhYuFO0UHJfJaVxG2equxgv5ZvlfCuSjCv48V5MvH9dOGF
         XpCBYOYUmyjgwZUV1kNuRyUtsJp1H2y18G6+zGTbM+oMOL18AzShwTPUgFF5hCCvNRvV
         7BrmerAYw0n8zVBRf4K13rvGm3ZDU+Sa12iEazUtuwOG6AWKsvQsAdM9enwCkl+z/3Rs
         FecIzUMzq3TORrMeY924pmPiY6Fnl5RZ7UG2EU0lZZ8Fr334oeVSujHccrVdytZmBMqd
         ug6A==
X-Gm-Message-State: ABy/qLZvTNYhAQghhpvGhMFPNvfAZkJJCuO3k68C5BA+FPRvwXZX+wT9
        B1uG3/1vPdIi9O5AC20Pf9MfOzfuY7HmuxcYksy64Cgo7g2OF9uRaD9lD4EAIY0rOb/d2llyeFn
        TPUVpH0vpWnPxRBuQTEIvY/nAlPDfXI0=
X-Received: by 2002:a05:6512:55c:b0:4fb:8603:f6aa with SMTP id h28-20020a056512055c00b004fb8603f6aamr10259729lfl.11.1688549667043;
        Wed, 05 Jul 2023 02:34:27 -0700 (PDT)
X-Google-Smtp-Source: APBJJlHdHXA+Wnp6hB3dyZ6CUVofgFnsSNYOrPiwVRr8+Xhwm5qD73pR2kC2waLM/BUW1Q1QrDqlPA==
X-Received: by 2002:a05:6512:55c:b0:4fb:8603:f6aa with SMTP id h28-20020a056512055c00b004fb8603f6aamr10259712lfl.11.1688549666653;
        Wed, 05 Jul 2023 02:34:26 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id u22-20020a05600c00d600b003faa6ce54b2sm1630439wmm.2.2023.07.05.02.34.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Jul 2023 02:34:26 -0700 (PDT)
From:   Javier Martinez Canillas <javierm@redhat.com>
To:     Thomas Zimmermann <tzimmermann@suse.de>,
        maarten.lankhorst@linux.intel.com, mripard@kernel.org
Cc:     dri-devel@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-fbdev@vger.kernel.org,
        Thierry Reding <thierry.reding@gmail.com>,
        Mikko Perttunen <mperttunen@nvidia.com>
Subject: Re: [PATCH 04/10] drm/tegra: Set fbdev flags
In-Reply-To: <f82635d8-4500-d420-f6ba-65aa515017e4@suse.de>
References: <20230704160133.20261-1-tzimmermann@suse.de>
 <20230704160133.20261-5-tzimmermann@suse.de>
 <87wmzerc2s.fsf@minerva.mail-host-address-is-not-set>
 <f82635d8-4500-d420-f6ba-65aa515017e4@suse.de>
Date:   Wed, 05 Jul 2023 11:34:25 +0200
Message-ID: <87a5war9b2.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
Content-Type: text/plain
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Thomas Zimmermann <tzimmermann@suse.de> writes:

[...]
   
>>> +	info->flags |= FBINFO_VIRTFB;
>> 
>> I see that all fbdev drivers just do: info->flags = FBINFO_FLAG_DEFAULT | FBINFO_VIRTFB
>> 
>> Guess you are doing in two assignments to be consistent with drm_fbdev_dma.c ?
>> I was just curious about the rationale for setting the flags in two steps.
>
> The _DEFAULT flag is really just a zero. And the other flags describe 
> different aspects of the framebuffer.  I think it makes sense to set the 
> flags together with the respective state. For example, _VIRTFB is set 
> next to ->screen_buffer, because they belong together.
>

Yes, that makes sense.

> _VIRTFB is currently only used in defio code at
>
> https://elixir.bootlin.com/linux/latest/source/drivers/video/fbdev/core/fb_defio.c#L232
>
> I think the fbdev I/O helpers should also test this flag after all 
> drivers have been annotated correctly. For example, fb_io_read() would 
> WARN_ONCE if the _VIRTFB flag has been set; and fb_sys_read() would warn 
> if it hasn't been set.  For the read helpers, it also makes sense to 
> WARN_ONCE if the _READS_FAST flag has not been set.
>

Agreed. Maybe you could add those warn (or at least info or debug?) even
if not all drivers have been annotated correctly. That way people can be
aware that is missing and fix if there are remaining drivers.

> Best regards
> Thomas
>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

