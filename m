Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0DD9B67AEE6
	for <lists+linux-samsung-soc@lfdr.de>; Wed, 25 Jan 2023 10:54:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234585AbjAYJyE (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Wed, 25 Jan 2023 04:54:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39864 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233965AbjAYJyD (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 25 Jan 2023 04:54:03 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C2568DBFC
        for <linux-samsung-soc@vger.kernel.org>; Wed, 25 Jan 2023 01:52:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1674640374;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=c6cPchqoXvC7fz4HOb1ChIaitTq8x3iNoLBlJaQ4TwQ=;
        b=ajymRgqzesHlDyjRtzzf4GoaDIEkCmdhsEAHLfvxU30Iq0plKkALI48ljdmHbkf8KJa0WC
        b0DSPIeD5BSMwNNH+o+IMUoQcjOW/qEexMzUIB8w7mc3ULi00xehGooHi/kaqxwglUJc0x
        YrCFZvTz2WbuHPXgkoHdeP9zB6tAD5Y=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-275-IYfegmrsNzmfbIzRuJasyw-1; Wed, 25 Jan 2023 04:52:51 -0500
X-MC-Unique: IYfegmrsNzmfbIzRuJasyw-1
Received: by mail-wr1-f71.google.com with SMTP id t20-20020adfba54000000b002be0eb97f4fso3035121wrg.8
        for <linux-samsung-soc@vger.kernel.org>; Wed, 25 Jan 2023 01:52:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=c6cPchqoXvC7fz4HOb1ChIaitTq8x3iNoLBlJaQ4TwQ=;
        b=Sp9Yu6iAOe8Zs01UweVmDiiV4xPBUBoofXC2wgDrjfKXFvWKqGxvTSGFozyWs+aN5A
         ML9JJHenh5q+pv5S2iYvWy4GNUAStjVqT2EnGEEXhgQfQWOqvedxuUqmofMe9PVlJA91
         JOnsw1WeTQWTe5dYSkZAPzvijxZUyTjmhgGGQr4569v1krpkj4D1gjJFI6gv6YRDGc+I
         3HCywIdwJdBdT35IvKAaVBg/vx+FZZgMlwxTJO8Gm9vIphLxO1zcmXdrvrZDLwtkQ0DY
         md+ZKYjH0si0gPoVDgV8HKK1rGb4M4PuqaCS03USptNpqEhh45yjnKYFfxcM5K95F9nd
         Ww3Q==
X-Gm-Message-State: AFqh2kpKsjHi/qFEo/7e0/vSY9UXJIsklSc0MUj0pMYEaJxi3vrNr1om
        waRalIU+ZItbxYqpQGCtbRr01lxy3Nk24R8nbj7TTF+9YPeC/Q25ZCofTLSpToPLYj5mW0FyCk4
        qKU/4OTohEyALf7odhC75Wb8PW3UXFPo=
X-Received: by 2002:adf:df10:0:b0:2bb:e891:1829 with SMTP id y16-20020adfdf10000000b002bbe8911829mr26349572wrl.4.1674640370485;
        Wed, 25 Jan 2023 01:52:50 -0800 (PST)
X-Google-Smtp-Source: AMrXdXuvmq2QmH2lib1EOjSoV1HyQPmQn7B/0nRysa3FFY81sXz4YqkvR1qkRuVsXj3rXTMZ7umf1Q==
X-Received: by 2002:adf:df10:0:b0:2bb:e891:1829 with SMTP id y16-20020adfdf10000000b002bbe8911829mr26349557wrl.4.1674640370241;
        Wed, 25 Jan 2023 01:52:50 -0800 (PST)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id q14-20020adff78e000000b002be07cbefb2sm4747862wrp.18.2023.01.25.01.52.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Jan 2023 01:52:49 -0800 (PST)
Message-ID: <8e5bb4ed-11fb-272d-4d70-f25252a0c5c5@redhat.com>
Date:   Wed, 25 Jan 2023 10:52:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v2 09/10] drm/fbdev-generic: Inline clean-up helpers into
 drm_fbdev_fb_destroy()
Content-Language: en-US
To:     Thomas Zimmermann <tzimmermann@suse.de>, airlied@gmail.com,
        daniel@ffwll.ch, maarten.lankhorst@linux.intel.com,
        mripard@kernel.org
Cc:     dri-devel@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, intel-gfx@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        amd-gfx@lists.freedesktop.org, linux-tegra@vger.kernel.org
References: <20230124134010.30263-1-tzimmermann@suse.de>
 <20230124134010.30263-10-tzimmermann@suse.de>
From:   Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20230124134010.30263-10-tzimmermann@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 1/24/23 14:40, Thomas Zimmermann wrote:
> The fbdev framebuffer cleanup in drm_fbdev_fb_destroy() calls
> drm_fbdev_release() and drm_fbdev_cleanup(). Inline both into the
> caller. No functional changes.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

