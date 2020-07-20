Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5A091226077
	for <lists+linux-samsung-soc@lfdr.de>; Mon, 20 Jul 2020 15:11:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728008AbgGTNKY (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Mon, 20 Jul 2020 09:10:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44010 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726619AbgGTNKY (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 20 Jul 2020 09:10:24 -0400
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com [IPv6:2a00:1450:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D01E6C0619D4
        for <linux-samsung-soc@vger.kernel.org>; Mon, 20 Jul 2020 06:10:23 -0700 (PDT)
Received: by mail-ej1-x642.google.com with SMTP id f12so17919402eja.9
        for <linux-samsung-soc@vger.kernel.org>; Mon, 20 Jul 2020 06:10:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=rerbV6N1bDL6/1+9jpHksMZzWF6eBpG3L+e70NIP7pA=;
        b=gjuRgM0y0NmST8Yu1aSYEUDLfA7aDzg29Dt9zCqnWDahUERE49F7BHL/R438kl2Lzh
         ug1OzJhYE9NMwvAwhLtao2/beM0ZAnyaKQRJ7dvkLAKfKfFBvQdthWAng5VzXVilvmT9
         p5dnNTBYwg3XhxFFA17GXkHrq+jM0rc4FE0IQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=rerbV6N1bDL6/1+9jpHksMZzWF6eBpG3L+e70NIP7pA=;
        b=X7hEG1EBuDENpybT/VQWEvNsYJKwSv1qBA+w8e9/rcm7KqAIzVMFC/pxP5ukKwGe7H
         ZkP/UFdjwhyGA7vwG0hCAv4TG6WYVzlyNpAgTRnz7H2F3YgxIQc8Ne4XZd+hRzE3XjNF
         faRczLjHOpzPCNIFLh7j/i91rkTqBp+NgCDgoc286OwWhAOl7vlM8KQZvgDR3IwDFYB2
         iltZFa6HdylxcEYbTWrorEjKPwNzHxHcEggxUHWxGyWObcttgYFIWlY25j/9fhKgzKTC
         wejsN9cbtLFtelN0pLwYDKYYhr4OvKdTZuIZBUbpnyQjOHqSPZfI0RkgIuPiCNK5XZgr
         M9bQ==
X-Gm-Message-State: AOAM532985fqu9e+yD/IcI21ZcSHTi+QDykaQBwj1FlBQaObKSv0ofC2
        fGAivko8ZzZrtIiqXxdD39reA8+ljqY=
X-Google-Smtp-Source: ABdhPJw2kAU7xzvXvCqauADI8NcvVLRCfnzd7MS5vvzNmX7xze0jgIuhvqF7PChQBsj3PPA5p+2+lA==
X-Received: by 2002:a17:906:3958:: with SMTP id g24mr20065404eje.26.1595250622074;
        Mon, 20 Jul 2020 06:10:22 -0700 (PDT)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com. [209.85.128.43])
        by smtp.gmail.com with ESMTPSA id a5sm15548064eda.35.2020.07.20.06.10.20
        for <linux-samsung-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Jul 2020 06:10:21 -0700 (PDT)
Received: by mail-wm1-f43.google.com with SMTP id 22so22225728wmg.1
        for <linux-samsung-soc@vger.kernel.org>; Mon, 20 Jul 2020 06:10:20 -0700 (PDT)
X-Received: by 2002:a1c:4303:: with SMTP id q3mr22458462wma.134.1595250620152;
 Mon, 20 Jul 2020 06:10:20 -0700 (PDT)
MIME-Version: 1.0
References: <20200426022650.10355-1-xc-racer2@live.ca> <BN6PR04MB0660DB1C884EE9F9C7D94857A3AE0@BN6PR04MB0660.namprd04.prod.outlook.com>
 <20200707184412.GJ2621465@chromium.org> <BN6PR04MB0660C1942C3738F9F9D1AAAFA3620@BN6PR04MB0660.namprd04.prod.outlook.com>
In-Reply-To: <BN6PR04MB0660C1942C3738F9F9D1AAAFA3620@BN6PR04MB0660.namprd04.prod.outlook.com>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Mon, 20 Jul 2020 15:10:07 +0200
X-Gmail-Original-Message-ID: <CAAFQd5ABvEnt7QQHmwwFyCqRLMabE=Vs_e7FrG3fMmrAWgD_bQ@mail.gmail.com>
Message-ID: <CAAFQd5ABvEnt7QQHmwwFyCqRLMabE=Vs_e7FrG3fMmrAWgD_bQ@mail.gmail.com>
Subject: Re: [PATCH 10/11] media: exynos4-is: Prevent duplicate call to media_pipeline_stop
To:     Jonathan Bakker <xc-racer2@live.ca>
Cc:     Kyungmin Park <kyungmin.park@samsung.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>, kgene@kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>, Joerg
        Roedel <joro@8bytes.org>," <linux-arm-kernel@lists.infradead.org>,
        linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Sat, Jul 11, 2020 at 8:17 PM Jonathan Bakker <xc-racer2@live.ca> wrote:
>
> Hi Tomasz,
>
> On 2020-07-07 11:44 a.m., Tomasz Figa wrote:
> > Hi Jonathan,
> >
> > On Sat, Apr 25, 2020 at 07:26:49PM -0700, Jonathan Bakker wrote:
> >> media_pipeline_stop can be called from both release and streamoff,
> >> so make sure they're both protected under the streaming flag and
> >> not just one of them.
> >
> > First of all, thanks for the patch.
> >
> > Shouldn't it be that release calls streamoff, so that only streamoff
> > is supposed to have the call to media_pipeline_stop()?
> >
>
> I can't say that I understand the whole media subsystem enough to know :)
> Since media_pipeline_start is called in streamon, it makes sense that str=
eamoff
> should have the media_pipeline_stop call.  However, even after removing t=
he call
> in fimc_capture_release I'm still getting a backtrace such as
>
> [   73.843117] ------------[ cut here ]------------
> [   73.843251] WARNING: CPU: 0 PID: 1575 at drivers/media/mc/mc-entity.c:=
554 media_pipeline_stop+0x20/0x2c [mc]
> [   73.843265] Modules linked in: s5p_fimc v4l2_fwnode exynos4_is_common =
videobuf2_dma_contig pvrsrvkm_s5pv210_sgx540_120 videobuf2_memops v4l2_mem2=
mem brcmfmac videobuf2_v4l2 videobuf2_common hci_uart sha256_generic libsha=
256 btbcm bluetooth cfg80211 brcmutil ecdh_generic ecc ce147 libaes s5ka3df=
x videodev atmel_mxt_ts mc pwm_vibra rtc_max8998
> [   73.843471] CPU: 0 PID: 1575 Comm: v4l2-ctl Not tainted 5.7.0-14534-g2=
b33418b254e-dirty #669
> [   73.843487] Hardware name: Samsung S5PC110/S5PV210-based board
> [   73.843562] [<c010c7c4>] (unwind_backtrace) from [<c010a120>] (show_st=
ack+0x10/0x14)
> [   73.843613] [<c010a120>] (show_stack) from [<c0117038>] (__warn+0xbc/0=
xd4)
> [   73.843661] [<c0117038>] (__warn) from [<c01170b0>] (warn_slowpath_fmt=
+0x60/0xb8)
> [   73.843734] [<c01170b0>] (warn_slowpath_fmt) from [<bf00c20c>] (media_=
pipeline_stop+0x20/0x2c [mc])
> [   73.843867] [<bf00c20c>] (media_pipeline_stop [mc]) from [<bf145c48>] =
(fimc_cap_streamoff+0x38/0x48 [s5p_fimc])
> [   73.844109] [<bf145c48>] (fimc_cap_streamoff [s5p_fimc]) from [<bf03cb=
f4>] (__video_do_ioctl+0x220/0x448 [videodev])
> [   73.844308] [<bf03cbf4>] (__video_do_ioctl [videodev]) from [<bf03d600=
>] (video_usercopy+0x114/0x498 [videodev])
> [   73.844438] [<bf03d600>] (video_usercopy [videodev]) from [<c0205024>]=
 (ksys_ioctl+0x20c/0xa10)
> [   73.844484] [<c0205024>] (ksys_ioctl) from [<c0100060>] (ret_fast_sysc=
all+0x0/0x54)
> [   73.844505] Exception stack(0xe5083fa8 to 0xe5083ff0)
> [   73.844546] 3fa0:                   0049908d bef8f8c0 00000003 4004561=
3 bef8d5ac 004c1d16
> [   73.844590] 3fc0: 0049908d bef8f8c0 bef8f8c0 00000036 bef8d5ac 0000000=
0 b6d6b320 bef8faf8
> [   73.844620] 3fe0: 004e3ed4 bef8c718 004990bb b6f00d0a
> [   73.844642] ---[ end trace e6a4a8b2f20addd4 ]---
>
> The command I'm using for testing is
>
> v4l2-ctl --verbose -d 1 --stream-mmap=3D3 --stream-skip=3D2 --stream-to=
=3D./test.yuv --stream-count=3D1
>
> Since I noticed that the streaming flag was being checked fimc_capture_re=
lease
> but not in fimc_cap_streamoff, I assumed that it was simply a missed chec=
k.  Comparing
> with other drivers, they seem to call media_pipeline_stop in their vb2_op=
s stop_streaming
> callback.

vb2 does a lot of state handling internally and makes sure that driver
ops are not called when unnecessary, preventing double calls for
example. I suppose it could be a better place to stop the pipeline
indeed. However, ...

>
> I'm willing to test various options
>

I think it could make sense to add something like WARN_ON(1) inside
media_pipeline_stop() and then check where the first call came from.

Best regards,
Tomasz
