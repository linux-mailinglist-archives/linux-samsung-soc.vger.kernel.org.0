Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0558A4C322D
	for <lists+linux-samsung-soc@lfdr.de>; Thu, 24 Feb 2022 17:51:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229455AbiBXQvn (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Thu, 24 Feb 2022 11:51:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51794 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230409AbiBXQvk (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 24 Feb 2022 11:51:40 -0500
Received: from mail-oi1-x236.google.com (mail-oi1-x236.google.com [IPv6:2607:f8b0:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 91F0C113AD4
        for <linux-samsung-soc@vger.kernel.org>; Thu, 24 Feb 2022 08:51:10 -0800 (PST)
Received: by mail-oi1-x236.google.com with SMTP id j2so3387426oie.7
        for <linux-samsung-soc@vger.kernel.org>; Thu, 24 Feb 2022 08:51:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=N8RCTotc4cmUTmsRA5J7naJcJh1Q7sGDDwovYyQT86k=;
        b=fg9hkYcI5u3dbEw84om3H3LjBjjbFYuyGuZzo+47DtuUpbVS1U4m45qC/FWjkCJ0Fq
         Eve4HcWP9XH/q1aMs4G4ocbr+xm+z0OIssB4urMuHCRuI/h6X87iF+ZPNhLWVkMUAt0+
         MTrapkTrtRJFqglGwZ0sh0i1pHqLXoEFoC9Fcl+8BV0ksyQ4oiITyBSys7yZZhX4vEnF
         C27Xn8uPVBu11qhWxaVSvdAR46bqzbW+nttpUdMm5PDNRVqQKBQFEYPhyBtPGYCFsVZo
         XmjrNqjO8pHZW7S7UelvdUQw+nGMK8Y3c7Q5UP6CqicM2vNVAoClaawvVilgXSWCOjPg
         4YOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=N8RCTotc4cmUTmsRA5J7naJcJh1Q7sGDDwovYyQT86k=;
        b=vw3oVN7vRFs3HUODMDPUsQKZORyvTF0XWvOsPrWMw4b06rO9Pa9O5fDt09BuEVN4R7
         mbQ57IcZuFEKD5RsaJ1b6XoQjQvgQBcQZfcj1z7t08ZbNVZN5w1kZe4viFUxb+6Af98A
         uAhjwDTs2DW5BntiXkKRigEab6ClDrDV6XWCzGkvEswGjh2t0n/QTt75qURkiCk/KDrj
         VQyN1XHnm/PvpaegPEqWe3j+QcO3bS0nFGzKE+ly11TqFuUKuIfJg0rxRmtVMif7fzpF
         v+/1t51LXjO1ZDKFJrNvBeUqypCtoKByXb3NBJMouAotDgFkg6f3tF4dWliI9nF2cfjd
         lnZQ==
X-Gm-Message-State: AOAM530mL3A41V/V+LPrg0GPWhPXKZvAb4EyAf1PpgFbBNUmTgHRFdf7
        PqFi379cY52dwhNDuOax1VJDWQ==
X-Google-Smtp-Source: ABdhPJyH21pu5ycMxU9OVqYiNC++pfYrdMu5u7iIlq5TKIHOHUPz7vUGqYR/Y3LCAml5DLdoA8oD4g==
X-Received: by 2002:a05:6808:1801:b0:2d7:206e:36fd with SMTP id bh1-20020a056808180100b002d7206e36fdmr3705715oib.3.1645721469908;
        Thu, 24 Feb 2022 08:51:09 -0800 (PST)
Received: from builder.lan ([2600:1700:a0:3dc8:3697:f6ff:fe85:aac9])
        by smtp.gmail.com with ESMTPSA id lc4-20020a056871418400b000c8a240183csm33827oab.25.2022.02.24.08.51.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Feb 2022 08:51:09 -0800 (PST)
Date:   Thu, 24 Feb 2022 10:51:07 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@wdc.com>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>, Wei Xu <xuwei5@hisilicon.com>,
        Nishanth Menon <nm@ti.com>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Tero Kristo <kristo@kernel.org>,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        Jan Kotas <jank@cadence.com>, Li Wei <liwei213@huawei.com>,
        Stanley Chu <stanley.chu@mediatek.com>,
        Yaniv Gardi <ygardi@codeaurora.org>,
        linux-scsi@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org,
        linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v2 09/15] scsi: ufs: deprecate 'freq-table-hz' property
Message-ID: <Yhe3e1coeUIGu+NB@builder.lan>
References: <20220222145854.358646-1-krzysztof.kozlowski@canonical.com>
 <20220222145854.358646-10-krzysztof.kozlowski@canonical.com>
 <YhUodbzxx4wbr+gy@ripper>
 <455a8a87-63e7-7864-f765-142be18d1fa8@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <455a8a87-63e7-7864-f765-142be18d1fa8@canonical.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Wed 23 Feb 03:15 CST 2022, Krzysztof Kozlowski wrote:

> On 22/02/2022 19:16, Bjorn Andersson wrote:
> > On Tue 22 Feb 06:58 PST 2022, Krzysztof Kozlowski wrote:
> > 
> >> The 'freq-table-hz' is not correct in DT schema, because '-hz' suffix
> >> defines uint32 type, not an array.  Therefore deprecate 'freq-table-hz'
> >> and use 'freq-table' instead.
> >>
> > 
> > Patch looks good in itself, but why don't we use opp-table to describe
> > the performance states?
> > 
> > In particular looking at the two columns of frequencies for various
> > Qualcomm boards they require different performance-states.
> > 
> > A concrete example is sm8350.dtsi, which specifies 75MHz and 300MHz as
> > the first frequency pair. The lower level requires the VDD_CX power rail
> > to be at least &rpmhpd_opp_low_svs, the higher frequency has a
> > required-opps of &rpmhpd_opp_nom.
> > 
> > 
> > As this isn't possible to express in the current binding we've just been
> > forced to always run at a higher voltage level and kept this in the todo
> > list.
> > 
> > But rather than migrating freq-table-hz to freq-table and then having to
> > introduce an opp table to express the power constraints, could we
> > perhaps skip the intermediate step?
> > 
> > Or would you have any other suggestion about how we can represent the
> > required-opps level together with the freq-table (if that's what we want
> > to stick with).
> 
> Usage of OPP tables is interesting solution. It would solve your problem
> of power rail levels. This would need several opp-tables - one for each
> clock, which is not a big problem.
> 

Ahh, so we can only have a single clock, but multiple regulators and
interconnect paths tied to the opp table.

We have a couple of cases where it would have been nice to be able to
key the opp-table off some index (e.g. the UFS gear or PCI Gen) and
control multiple clocks. So I think we need to look into this further...

> The problem is that I do not have any UFS hardware (none of my Samsung
> Exynos boards have UFS... I don't have even arm64 Exynos chips :( ), so
> implementing it theoretically will be painful.
> OTOH, I believe that having a working dtschema is very useful. Having
> dtschema without errors/warnings is even worth some churn/intermediary work.
> 
> The intermediary work is also not that big. Once proper OPP is
> implemented, we will have "just" two deprecated properties in the bindings.
> 

Fair enough, was just hoping to avoid the middle step. But that's fine,
we'll continue to carry this on our todo list then.

Thanks,
Bjorn
