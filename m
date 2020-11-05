Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 57E5E2A7B3B
	for <lists+linux-samsung-soc@lfdr.de>; Thu,  5 Nov 2020 11:06:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726801AbgKEKGH (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Thu, 5 Nov 2020 05:06:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59784 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726400AbgKEKGH (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 5 Nov 2020 05:06:07 -0500
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 16BBBC0613CF
        for <linux-samsung-soc@vger.kernel.org>; Thu,  5 Nov 2020 02:06:07 -0800 (PST)
Received: by mail-pg1-x541.google.com with SMTP id t14so1089313pgg.1
        for <linux-samsung-soc@vger.kernel.org>; Thu, 05 Nov 2020 02:06:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=eGW1ILzr61LRI7Nn5j3Px4Z853itoyrKaaACPPuanD8=;
        b=AwkPgeKN8JxD5DofrhKKvVmK4cvSq6debaCUoSYPEqvE49cn04nt/Ohj9eefgHf9TL
         aIx6rKXj0///p0JGjzTLdfu2hmMAvQApkss/uH/gSZkh61VO6pZ2ylsM9Il/53KW7LGl
         IUDWHNviUCd6hnxXLRNUeX3Y6HNhSHtWwbsLSi36WRlNoTuyeXeVCGre4buS3NdKlXZ1
         C93L+wYAB2E1lwHrDLcQqvzcXv151CIyLt/YY5KfH9h0bSL8R2KSSrdlcms3OAEXEAQn
         s+1SmPefG0RRF/HzCmYyPjNZRXZ/yeV4tDx9EOD1LS9Yd2qnGpLlBgdhBvWMqnBFNCh+
         Memw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=eGW1ILzr61LRI7Nn5j3Px4Z853itoyrKaaACPPuanD8=;
        b=nrkABog7CNkIf4bfgsEY5NSQvqjdPFv3P5wSQG2HfSg2Rkfd0CbUZZjTwoa8fI3Uwn
         luW261W1fHEvdD9g0zu2lnY2YYp569vFifRZ2WZQs27Dq2wnFydYmAm+OOJJNvqj9zIX
         073rPJjpT0Up0GajJQQDsyNJb7aKQ/AQ+319J9GjWBrgHL2XL1XhLHAf5K7dVLUnwyx/
         rzRlL98kBBD/iS+8Upthjf1Mr2H+O0iOsFXKb36rScd5MpLLz3JvWlW2wOwZyUf36wum
         0UKTSkDNWrJEyAn/6MPikXg0sOGln46w6rqq19W5J8SeR1urc1MgCkOdOr0nsJl5pQ1P
         Zn5Q==
X-Gm-Message-State: AOAM533rqiDnKK4Tc0XilJ7ZRrgRQylG7TlBo59NDcr9U4qTCuajVALW
        W5hqNkFuNX9sv5kFhEtPlrX/VA==
X-Google-Smtp-Source: ABdhPJx+19aSHb7auOFJLKtzrXZ1adaxUM3Bi1xOIxWA6Q/xzn6rrIYE3T8B5dM0UQjbWyOAIsn6/Q==
X-Received: by 2002:a17:90b:ec9:: with SMTP id gz9mr1700784pjb.105.1604570766580;
        Thu, 05 Nov 2020 02:06:06 -0800 (PST)
Received: from localhost ([122.172.12.172])
        by smtp.gmail.com with ESMTPSA id s22sm1813783pfu.119.2020.11.05.02.06.05
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 05 Nov 2020 02:06:05 -0800 (PST)
Date:   Thu, 5 Nov 2020 15:36:03 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Ulf Hansson <ulf.hansson@linaro.org>
Cc:     Dmitry Osipenko <digetx@gmail.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Alan Stern <stern@rowland.harvard.edu>,
        Peter Chen <Peter.Chen@nxp.com>,
        Mark Brown <broonie@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Lee Jones <lee.jones@linaro.org>,
        Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Peter Geis <pgwipeout@gmail.com>,
        Nicolas Chauvet <kwizart@gmail.com>,
        linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
        driverdevel <devel@driverdev.osuosl.org>,
        Linux USB List <linux-usb@vger.kernel.org>,
        linux-pwm@vger.kernel.org,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        DTML <devicetree@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        linux-tegra <linux-tegra@vger.kernel.org>
Subject: Re: [PATCH v1 00/30] Introduce core voltage scaling for NVIDIA
 Tegra20/30 SoCs
Message-ID: <20201105100603.skrirm7uke4s2xyl@vireshk-i7>
References: <20201104234427.26477-1-digetx@gmail.com>
 <CAPDyKFr7qTU2RPhA_ZrbCayoTTNUEno1zdmvmv+8HBe-Owrfeg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPDyKFr7qTU2RPhA_ZrbCayoTTNUEno1zdmvmv+8HBe-Owrfeg@mail.gmail.com>
User-Agent: NeoMutt/20180716-391-311a52
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 05-11-20, 10:45, Ulf Hansson wrote:
> + Viresh

Thanks Ulf. I found a bug in OPP core because you cc'd me here :)

> On Thu, 5 Nov 2020 at 00:44, Dmitry Osipenko <digetx@gmail.com> wrote:
> I need some more time to review this, but just a quick check found a
> few potential issues...
> 
> The "core-supply", that you specify as a regulator for each
> controller's device node, is not the way we describe power domains.

Maybe I misunderstood your comment here, but there are two ways of
scaling the voltage of a device depending on if it is a regulator (and
can be modeled as one in the kernel) or a power domain.

In case of Qcom earlier (when we added the performance-state stuff),
the eventual hardware was out of kernel's control and we didn't wanted
(allowed) to model it as a virtual regulator just to pass the votes to
the RPM. And so we did what we did.

But if the hardware (where the voltage is required to be changed) is
indeed a regulator and is modeled as one, then what Dmitry has done
looks okay. i.e. add a supply in the device's node and microvolt
property in the DT entries.

-- 
viresh
