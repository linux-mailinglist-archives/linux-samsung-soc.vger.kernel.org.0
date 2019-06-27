Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 179CD57989
	for <lists+linux-samsung-soc@lfdr.de>; Thu, 27 Jun 2019 04:34:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727267AbfF0CeF (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Wed, 26 Jun 2019 22:34:05 -0400
Received: from mail-lf1-f65.google.com ([209.85.167.65]:43908 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727193AbfF0CeE (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 26 Jun 2019 22:34:04 -0400
Received: by mail-lf1-f65.google.com with SMTP id j29so425293lfk.10
        for <linux-samsung-soc@vger.kernel.org>; Wed, 26 Jun 2019 19:34:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lixom-net.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=bmZJISlXE+U3LQbzyWPwLynPr7jlpqsoB8iC1INwlmM=;
        b=l0fRgG6s+Fq4A18lpg1cxdbOcioeTu4Lm9DFecpTmnboqpRODLS8/3Ezj5SdtIZIuk
         Wn8UgPzpC7ysvIfJ/75x/ph8s+Ph2ewQWvhqysp2uS+X8WmOh7bxpCmBHVBMHAAbLwFc
         7zAUBNpZLUaf/MMon/8EPpcAGWLRKDbyYzbT1wglTq2YDzLiG3k7BXAAiODHLOyuUPlB
         iZZdljnqJHv8rQaCplv+KHAV6aUoZ7U2cuYRQMTjpTrTrhg78j55H0mnOamxgp6AVOwX
         pPWJ7BGJL6bMRcXxZZ3/JhelsJ/7RnCnggOPohTYWj4Q/nU3YYn5dH66kVOHw2nu8p81
         UQhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=bmZJISlXE+U3LQbzyWPwLynPr7jlpqsoB8iC1INwlmM=;
        b=emkLjJbQE4H95vnZN0q8aK1/u+ljh3Cma/apzKFLp8mxOnxQx+rPsbMiEnxX4ZrPV4
         EsjyPrEEor8qACU+wbRKZ6s5KPKUi47egZZVsBVcSrzZlPnc5q8oVmJYKLEJGXthYNOP
         MFGfPL7eIKLsaCI0m3+HeRUGZk305tLKnJQZ+hj4s/O3R+3YIt5RX7eshnR21HfmcZSg
         FplcQ/XsWDL79y1VGJqZO8oe9ACuNRP5sVS/2Bnae3CbtdxwGUe9rhyFOculn+TS4HqT
         1iC22h3z/fpHt0kaz8eCtlDnTLBvSJAL4mKwktw2rXrpL4RECLu2MCa0c4mpHFwjDv4f
         9aBQ==
X-Gm-Message-State: APjAAAW7qPYcnBDaOMohzrv5dOHshpUtPCbEu6Qlufl+BuASxV6sTltJ
        BnvbJgMmyMYCyGv3DGsAe4O3yBusLFb2HA==
X-Google-Smtp-Source: APXvYqzcEMNH2SId1inLyk+J0pyMhziInEuh2kv5k68TYehUYeGHVMexHLTYWG7dVGa5w4SVlN6Qwg==
X-Received: by 2002:a19:6e41:: with SMTP id q1mr691970lfk.20.1561602842567;
        Wed, 26 Jun 2019 19:34:02 -0700 (PDT)
Received: from localhost (h85-30-9-151.cust.a3fiber.se. [85.30.9.151])
        by smtp.gmail.com with ESMTPSA id b6sm121113lfa.54.2019.06.26.19.34.01
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 26 Jun 2019 19:34:01 -0700 (PDT)
Date:   Wed, 26 Jun 2019 19:30:33 -0700
From:   Olof Johansson <olof@lixom.net>
To:     Krzysztof Kozlowski <krzk@kernel.org>
Cc:     Arnd Bergmann <arnd@arndb.de>, arm@kernel.org,
        Kukjin Kim <kgene@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [GIT PULL 4/4] ARM: exynos: Mach for v5.3
Message-ID: <20190627023033.kvw7dvbifwkvfcav@localhost>
References: <20190625193451.7696-1-krzk@kernel.org>
 <20190625193451.7696-4-krzk@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190625193451.7696-4-krzk@kernel.org>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Tue, Jun 25, 2019 at 09:34:51PM +0200, Krzysztof Kozlowski wrote:
> The following changes since commit a188339ca5a396acc588e5851ed7e19f66b0ebd9:
> 
>   Linux 5.2-rc1 (2019-05-19 15:47:09 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-soc-5.3
> 
> for you to fetch changes up to a55e040c6f21f55f81c53c56e1d8095df35e1d02:
> 
>   ARM: exynos: Cleanup cppcheck shifting warning (2019-06-25 20:45:09 +0200)
> 
> ----------------------------------------------------------------
> Samsung mach/soc changes for v5.3
> 
> Only cleanups and minor fixes.

Merged, thanks!


-Olof
