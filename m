Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 069887BFAD2
	for <lists+linux-samsung-soc@lfdr.de>; Tue, 10 Oct 2023 14:09:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231365AbjJJMJp (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Tue, 10 Oct 2023 08:09:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47018 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231311AbjJJMJp (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 10 Oct 2023 08:09:45 -0400
Received: from mail-qk1-x72d.google.com (mail-qk1-x72d.google.com [IPv6:2607:f8b0:4864:20::72d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 44076A4
        for <linux-samsung-soc@vger.kernel.org>; Tue, 10 Oct 2023 05:09:43 -0700 (PDT)
Received: by mail-qk1-x72d.google.com with SMTP id af79cd13be357-77409065623so324689085a.0
        for <linux-samsung-soc@vger.kernel.org>; Tue, 10 Oct 2023 05:09:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696939782; x=1697544582; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=DgSEBJcUi7PZ5OXedvwInXaFNURNqtsaL0h7wFFXk5g=;
        b=Df3KmV6NzyoruKmJufGdyQeVIeM94xePXheDrzzm9/krPQ0jAEIvv5Ien2F0RrmPkc
         uKtla/0xPvuSxqAgH3p7HrD1gT5kWUMhkFfSaj2ib46V3FRNFcTfUaSMQCuPpFR8yOY3
         ixA9gJeTCoBtX65NfpE1VpxFHHWM1IdKP+fgDyZFX/UGcvBbWstNlDicBgxoYFenAWBj
         G+VdxULEkMAl7xmCRg6IDmZ1apVCjQz4IXjBbkj+kPs1eOuakvTCAqcIKrqoHV+PT5rb
         dhg1fPXp3J9LipxYR2CpFtPNfBMnW3oIB2gC/ElJ0ChXIvUEDMcqENyf/3GxkwMykgQM
         FIfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696939782; x=1697544582;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DgSEBJcUi7PZ5OXedvwInXaFNURNqtsaL0h7wFFXk5g=;
        b=AfN4lRDD7oy5WSiPgyzVyzOHS7gBLgAIOeoOyopgPdfgQS8JliP2bkR6nqnqCvC4yB
         xcVT0O7raWG1kdHgTcjywSRtmPBpbIr8pYwwEgV44MzHDcXd9Duzt4Y9JzUAb5fkNCFK
         ogh8CJnHCq6bT+YO+z65RlfVdqHtb6AAuingtFX1XQcoeEnuNHFSNVAABMBwDo6OSPWX
         0nJVOAvS4+v03lvVNFfF4eB8VUPeCfew2tFAhPGZVki/4twh67miAtdQZsG2URuNZMxp
         ruEzdnlOwQEXc7zcvwalnoQhJyvZHNE0299q+Kguu4THR2jp4JpBpVdkDAtHaH9mr1kt
         WOJw==
X-Gm-Message-State: AOJu0Yz8riYyyTwdwnftdz+2C81Z016S72AcJVtsIsnhPCbPLZWBQXok
        R3f+X6Vi88j6mOxBqkZ/48X6Rk9AKzrVRX1HMxdeIg==
X-Google-Smtp-Source: AGHT+IEkobWfRAv+hk9GeXAgYbAsdwwHInRJB4q4A/k6gLUZyJCTapOQUejfM/de0SvYVTlXeCdNVMlVoHapdH1mpY8=
X-Received: by 2002:ad4:5cc7:0:b0:65d:dcc:9754 with SMTP id
 iu7-20020ad45cc7000000b0065d0dcc9754mr22900149qvb.30.1696939782310; Tue, 10
 Oct 2023 05:09:42 -0700 (PDT)
MIME-Version: 1.0
References: <20231005155618.700312-1-peter.griffin@linaro.org>
 <20231005155618.700312-20-peter.griffin@linaro.org> <20231006205204.GA269353-robh@kernel.org>
In-Reply-To: <20231006205204.GA269353-robh@kernel.org>
From:   Peter Griffin <peter.griffin@linaro.org>
Date:   Tue, 10 Oct 2023 13:09:31 +0100
Message-ID: <CADrjBPpEFo4gRTsWau+xGoBAr2j7srhbxYefJGDer+PRu9QxBg@mail.gmail.com>
Subject: Re: [PATCH 19/21] google/gs101: Add dt overlay for oriole board
To:     Rob Herring <robh@kernel.org>
Cc:     krzysztof.kozlowski+dt@linaro.org, mturquette@baylibre.com,
        conor+dt@kernel.org, sboyd@kernel.org, tomasz.figa@gmail.com,
        s.nawrocki@samsung.com, linus.walleij@linaro.org,
        wim@linux-watchdog.org, linux@roeck-us.net,
        catalin.marinas@arm.com, will@kernel.org, arnd@arndb.de,
        olof@lixom.net, cw00.choi@samsung.com, tudor.ambarus@linaro.org,
        andre.draszik@linaro.org, semen.protsenko@linaro.org,
        soc@kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-watchdog@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi Rob,

Thanks for your review!

On Fri, 6 Oct 2023 at 21:52, Rob Herring <robh@kernel.org> wrote:
>
> On Thu, Oct 05, 2023 at 04:56:16PM +0100, Peter Griffin wrote:
> > The LK bootloader on Pixel6 searches for a dt overlay in the
> > dtbo partition with a board_id and board_rev that matches
> > what is baked into the device. If this overlay is not present
> > then the phone will bootloop in fastboot and you can't boot
> > the upstream kernel.
> >
> > This commit adds a dtbo for the production oriole variant.
> > The other pre-production board overlays are not included
> > at this time.
> >
> > Adding the dtbo here allows for a better experience when
> > building/booting the upstream kernel on Pixel devices
> > as all the DT required to boot the device will be created
> > as part of the kernel build process. Rather than having to
> > fetch the dtbo from some other repo.
> >
> > Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> > ---
> >  arch/arm64/boot/dts/google/Makefile          |  1 +
> >  arch/arm64/boot/dts/google/gs101-oriole.dtso | 21 ++++++++++++++++++++
> >  2 files changed, 22 insertions(+)
> >  create mode 100644 arch/arm64/boot/dts/google/gs101-oriole.dtso
> >
> > diff --git a/arch/arm64/boot/dts/google/Makefile b/arch/arm64/boot/dts/google/Makefile
> > index 6d2026a767d4..3f1761f8daa9 100644
> > --- a/arch/arm64/boot/dts/google/Makefile
> > +++ b/arch/arm64/boot/dts/google/Makefile
> > @@ -2,5 +2,6 @@
> >
> >  dtb-$(CONFIG_ARCH_GOOGLE_TENSOR) += \
> >       gs101-oriole.dtb \
> > +     gs101-oriole.dtbo
>
> Overlays in the kernel must be able to be applied to a base DT in the
> kernel. Add a rule to apply this (hint: a '-dtbs' variable does this
> similar to -objs variables).

Ok will do, thanks for the hint

>
> > diff --git a/arch/arm64/boot/dts/google/gs101-oriole.dtso b/arch/arm64/boot/dts/google/gs101-oriole.dtso
> > new file mode 100644
> > index 000000000000..50832fd94204
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/google/gs101-oriole.dtso
> > @@ -0,0 +1,21 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +/*
> > + * Oriole DVT Device Tree
>
> Doesn't DVT mean pre-production?

Yes, DVT stands for Design Verification Testing. I can remove that
DVT suffix for v2.
I suppose that means there were no changes between DVT and production as this
is the overlay used by the production devices.

regards,

Peter
