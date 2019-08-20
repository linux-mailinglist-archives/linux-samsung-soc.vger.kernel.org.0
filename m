Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 262EC954B7
	for <lists+linux-samsung-soc@lfdr.de>; Tue, 20 Aug 2019 05:01:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728975AbfHTDBU (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Mon, 19 Aug 2019 23:01:20 -0400
Received: from mail-pl1-f194.google.com ([209.85.214.194]:38595 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728773AbfHTDBU (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 19 Aug 2019 23:01:20 -0400
Received: by mail-pl1-f194.google.com with SMTP id m12so1960566plt.5
        for <linux-samsung-soc@vger.kernel.org>; Mon, 19 Aug 2019 20:01:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=HcHMT4PO4aRPYDjhgvvcGFKWPsyZ2i/AKZp147gpb5c=;
        b=viL6XfoedAqOcc/HJQnJMBOYsdVq2vOZFFWALl/6A16nYkuuAVsJHbhTaeECSJc5Zz
         hzWGJA4gfwyZsEad9v+PIB1172n7T7M2E400hAOkUFPq7Aj0uLS9A2YAxUNLe+T4PG1P
         ABkkGE50E/dJxcxRzf+07PFLDwK6NkNCEYKsqdIgZ5vS36/b+subF11lyZJMf65sycaw
         u3kl8jnMdCK9+9ljUmJMs3whQ1VMAS9LC5FYZ6M88g/URRNO9ehEkCjJ8gb+Tb+aCwUz
         uKKtx390D8iHg3JeksxQPB1bBKqsL/UtWOkxjT6NZSJBiGilrKbGyRK5uYO6GABTo56l
         VZqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=HcHMT4PO4aRPYDjhgvvcGFKWPsyZ2i/AKZp147gpb5c=;
        b=QAseDBBmgY8EiR07/WIaWLJI1KOsMQRf5ncirVXSYQ/GDH6/jOwvmj3da/trI3Te1X
         nexdyASjuVCF2K+b7jcHQ4eFA9U28+N3y9zfu0Ra90cWJZB6/03l0mWb5VKmeiVrexW8
         fx5UPRrZZ4uVYKkzvY0Z3Ii7hi/JlccxWfQ60AUBhbMjpxhd1dAfcZsZMqKDWPM327bh
         Ar3UAnUKtT7BnkT/G16o2rPMn5HxvqbXwg3A7HPR2m9MTr2v2DPVg56wzbQPdDQSJ4qY
         ILDnd7BGax7B8C+nr+6YkubVDq103IBS6Tjf+KXzvSDpSCu7uHWWFsHZZq41bhPv8QEq
         m8/w==
X-Gm-Message-State: APjAAAVVeMNFTmUcwon628ervS86WY6QOLPX5fdvXq3fQIUkCKHIyCTx
        qyEcLWGcb+AeYCdSSORAVKEANA==
X-Google-Smtp-Source: APXvYqxt17woC6XIhk4kgcxthGKuzkZCAMPDaISXnF4cF6l1VR+/21W6CcuyWj97AkLWty58n/BIoA==
X-Received: by 2002:a17:902:54d:: with SMTP id 71mr25255114plf.140.1566270079363;
        Mon, 19 Aug 2019 20:01:19 -0700 (PDT)
Received: from localhost ([122.172.76.219])
        by smtp.gmail.com with ESMTPSA id n7sm17609938pff.59.2019.08.19.20.01.17
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 19 Aug 2019 20:01:18 -0700 (PDT)
Date:   Tue, 20 Aug 2019 08:31:14 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>, krzk@kernel.org,
        robh+dt@kernel.org, vireshk@kernel.org, devicetree@vger.kernel.org,
        kgene@kernel.org, pankaj.dubey@samsung.com,
        linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, b.zolnierkie@samsung.com
Subject: Re: [PATCH v2 0/9] Exynos Adaptive Supply Voltage support
Message-ID: <20190820030114.6flnn2omeys3lih3@vireshk-i7>
References: <CGME20190718143117eucas1p1e534b9075d10fbbbe427c66192205eb1@eucas1p1.samsung.com>
 <20190718143044.25066-1-s.nawrocki@samsung.com>
 <20190723020450.z2pqwetkn2tfhacq@vireshk-i7>
 <5ef302a4-5bbf-483d-dfdf-cf76f6f69cee@samsung.com>
 <20190725022343.p7lqalrh5svxvtu2@vireshk-i7>
 <562dd2e7-2b24-8492-d1c1-2dc4973f07be@samsung.com>
 <20190819090928.pke6cov52n4exlbp@vireshk-i7>
 <b831d7c5-c830-fd65-20cf-02e209889c28@samsung.com>
 <20190819112533.bvfyinw7fsebkufr@vireshk-i7>
 <b7093aaf-ea56-c390-781f-6f9d0780bd8e@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b7093aaf-ea56-c390-781f-6f9d0780bd8e@samsung.com>
User-Agent: NeoMutt/20180716-391-311a52
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 19-08-19, 15:39, Sylwester Nawrocki wrote:
> Unfortunately not, the patch set as I see it is another way of updating 
> an OPP after it was parsed from DT.  OPP remove/add could work equally 
> well in our use case.

Adding OPPs dynamically has limitations, you can't set many values which are
otherwise possible with DT. And removing/adding is not the right thing to do
technically.

> The problem is that we have the information on how to translate the 
> common OPP voltage to a voltage specific to given silicon encoded jointly 
> in the ASV tables and the CHIPID registers (efuse/OTP memory). 
> Additionally, algorithm of selecting ASV data (OPP voltage) based on 
> the "key" data from registers is not generic, it is usually different 
> per each SoC type.
> 
> I tried to identify some patterns in those tables in order to simplify 
> possible DT binding, but that was not really successful. I ended up just 
> keeping whole tables.

Sorry but I am unable to understand the difficulty you are facing now. So what I
suggest is something like this.

- Use DT to get a frequency and voltage for each frequency.
- At runtime, based on SoC, registers, efuses, etc, update the voltage of the
  OPPs.
- This algo can be different for each SoC, no one is stopping you from doing
  that.

Am I missing something ?

-- 
viresh
