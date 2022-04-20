Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A02A2508522
	for <lists+linux-samsung-soc@lfdr.de>; Wed, 20 Apr 2022 11:40:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1377275AbiDTJnh (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Wed, 20 Apr 2022 05:43:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39880 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1353200AbiDTJng (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 20 Apr 2022 05:43:36 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EFFCA245AC;
        Wed, 20 Apr 2022 02:40:48 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id A9E4BB81DD2;
        Wed, 20 Apr 2022 09:40:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F2FCC385A1;
        Wed, 20 Apr 2022 09:40:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1650447646;
        bh=kmxHX9KGhOeDI7emOTTeHqve4kE7RuPhBjtWA51Q9zY=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=mScdn0jyuErAkKsDTiXFtqxAItLAeX9i6EAsWvCPSbwR0H7jldR7nCoyDwumX+S5/
         WYfci5oSZwW9az0KsCesin2f0H2Sd2xf6XXqu4qLEc1R0jCALxSuoDFAsZuTJqKDKP
         /PEegfQL24T4Q7vKsAkIpNXnFAZsY5egidKMPSNgFcJpGVNgRvncs9ctIiyB/FTOyf
         hnrrAC9vysricw9DYUtCD3QQacmWeCqkchrVqE5z9SCN/mSl8/l1vAEc5bJkdY0pKT
         DojoOXS6aayngrxvc6apwXyOy96+/2ojPhCvx7K2xsWpz/jC6XGu4pgJnNE9offiXX
         NicLnVpCuCdkw==
Received: from sofa.misterjones.org ([185.219.108.64] helo=why.misterjones.org)
        by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <maz@kernel.org>)
        id 1nh6pH-005Zj8-UY; Wed, 20 Apr 2022 10:40:44 +0100
Date:   Wed, 20 Apr 2022 10:40:43 +0100
Message-ID: <87mtgg9jok.wl-maz@kernel.org>
From:   Marc Zyngier <maz@kernel.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        'Linux Samsung SOC' <linux-samsung-soc@vger.kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        John Garry <john.garry@huawei.com>,
        Xiongfeng Wang <wangxiongfeng2@huawei.com>,
        David Decotigny <ddecotig@google.com>
Subject: Re: [PATCH v3 2/3] genirq: Always limit the affinity to online CPUs
In-Reply-To: <70123e98-046f-f10e-1032-8d112edd3ecf@linaro.org>
References: <20220405185040.206297-1-maz@kernel.org>
        <20220405185040.206297-3-maz@kernel.org>
        <CGME20220413145922eucas1p2dc46908354f4d2b48db79978d086a838@eucas1p2.samsung.com>
        <4b7fc13c-887b-a664-26e8-45aed13f048a@samsung.com>
        <878rs8c2t2.wl-maz@kernel.org>
        <5dcf8d22-e9b3-f306-4c5f-256707e08fbf@samsung.com>
        <877d7sar5k.wl-maz@kernel.org>
        <39f69dfe-32e5-4cb3-118b-5c02b28cbcff@samsung.com>
        <70123e98-046f-f10e-1032-8d112edd3ecf@linaro.org>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) SEMI-EPG/1.14.7 (Harue)
 FLIM-LB/1.14.9 (=?UTF-8?B?R29qxY0=?=) APEL-LB/10.8 EasyPG/1.0.0 Emacs/27.1
 (x86_64-pc-linux-gnu) MULE/6.0 (HANACHIRUSATO)
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: krzysztof.kozlowski@linaro.org, m.szyprowski@samsung.com, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, tglx@linutronix.de, john.garry@huawei.com, wangxiongfeng2@huawei.com, ddecotig@google.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi Krzysztof,

On Wed, 20 Apr 2022 10:13:52 +0100,
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> wrote:
> 
> On 14/04/2022 13:08, Marek Szyprowski wrote:
> >> Thanks for all of the debug, super helpful. The issue is that we don't
> >> handle the 'force' case, which a handful of drivers are using when
> >> bringing up CPUs (and doing so before the CPUs are marked online).
> >>
> >> Can you please give the below hack a go?
> > 
> > This patch fixed the issue. Thanks! Feel free to add my:
> > 
> > Reported-by: Marek Szyprowski <m.szyprowski@samsung.com>
> > 
> > Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
> 
> Hi Marc,
> 
> Linux-next still fails to boot on Exynos5422 boards, so I wonder if you
> applied the fix?

It was picked up by Thomas and pushed out into tip, which is pulled by
-next:

maz@hot-poop:~/arm-platforms$ git describe --contains c48c8b829d2b966a6649827426bcdba082ccf922
next-20220420~51^2~3^2

So it definitely is in today's -next.

> Instead of silent fail there is now "Unable to handle kernel paging
> request at virtual address f0836644", so it is slightly different.
> 
> See the dmesg:
> https://krzk.eu/#/builders/21/builds/3542/steps/15/logs/serial0

This looks completely unrelated:

[   10.382010] Unable to handle kernel paging request at virtual address f0836644
[   10.388597] [f0836644] *pgd=41c83811, *pte=00000000, *ppte=00000000
[   10.394482] Internal error: Oops: 807 [#1] PREEMPT SMP ARM
[   10.399567] Modules linked in:
[   10.402583] CPU: 2 PID: 1 Comm: swapper/0 Not tainted 5.18.0-rc3-next-20220420 #2
[   10.410060] Hardware name: Samsung Exynos (Flattened Device Tree)
[   10.416106] PC is at cpu_ca15_set_pte_ext+0x4c/0x58
[   10.420952] LR is at handle_pte_fault+0x218/0x260
[   10.425631] pc : [<c011d588>]    lr : [<c02ab188>]    psr: 40000113
[   10.431874] sp : f0835df0  ip : f0835e5c  fp : 00000081
[   10.437069] r10: c0f2eafc  r9 : c1d31000  r8 : 00000000
[   10.442268] r7 : c1d58000  r6 : 00000081  r5 : befffff6  r4 : f0835e24
[   10.448773] r3 : 00000000  r2 : 00000000  r1 : 00000040  r0 : f0835e44
[   10.455273] Flags: nZcv  IRQs on  FIQs on  Mode SVC_32  ISA ARM  Segment none
[   10.462381] Control: 10c5387d  Table: 4000406a  DAC: 00000051

This is a crash in cpu_ca15_set_pte_ext() when populating the
userspace page tables, which seems unrelated to interrupt affinity.

I suggest you bisect this to find the actual problem.

Thanks,

	M.

-- 
Without deviation from the norm, progress is not possible.
