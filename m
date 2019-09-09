Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9BDEDADF1A
	for <lists+linux-samsung-soc@lfdr.de>; Mon,  9 Sep 2019 20:45:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727848AbfIISpJ (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Mon, 9 Sep 2019 14:45:09 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:37109 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727164AbfIISpJ (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 9 Sep 2019 14:45:09 -0400
Received: by mail-wr1-f67.google.com with SMTP id i1so14631467wro.4
        for <linux-samsung-soc@vger.kernel.org>; Mon, 09 Sep 2019 11:45:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=YrOL30sDY0fFF3RO25P1Z4nhWQj8HX+rJUPrTFeiHjI=;
        b=b/AOelDRo/fwIaaVPz02ypLze+2+Od7wgO7vFxCpcOvR5iUFAOccuCiatajynk7rNK
         qGp4T6Ldt9PImYbCWvQYpe2KCnh9U3Yudb5TnA6hxPUvm7gmyCJ2ZtfqCQ3LDWnbDY4m
         T/hXKuoYD8tJa+pYw3gpkiDTUQvddAVvylVXgf4sgOOtCHMlkXC4K1gjNswMTJ2E/f43
         /b4KR9gb+xNm6ZycV8dmRLjBQgWZcQsrOqUybptmmd0HqEDFuxix0tCK7vjjfOm1soJ/
         tnc0r+uQ3QWbEvmnMoopROUBkSaI36s/ro0QPLa18izrFFoDf4Q3L4fJK/lF0t1pAji2
         fGxQ==
X-Gm-Message-State: APjAAAWGcMhTfmqnHPIAOVGT7aHtoLWnuc7dsNMcYwUkClNMIcwy+cjf
        OC3xe7zZ+xWMVoynJBNVCKpWN7Dl
X-Google-Smtp-Source: APXvYqypKq1gidEje2zDbtyoHFnpUOuyRNZlAkMPaKqkKBaiy31lqOmVJcIZndIVISluIOUl3RpSkw==
X-Received: by 2002:a5d:4709:: with SMTP id y9mr19868329wrq.129.1568054707627;
        Mon, 09 Sep 2019 11:45:07 -0700 (PDT)
Received: from kozik-lap ([194.230.155.145])
        by smtp.googlemail.com with ESMTPSA id b16sm22275446wrh.5.2019.09.09.11.45.06
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 09 Sep 2019 11:45:06 -0700 (PDT)
Date:   Mon, 9 Sep 2019 20:45:04 +0200
From:   "krzk@kernel.org" <krzk@kernel.org>
To:     Yao Lihua <ylhuajnu@outlook.com>
Cc:     "kgene@kernel.org" <kgene@kernel.org>,
        "linux-samsung-soc@vger.kernel.org" 
        <linux-samsung-soc@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH 0/2] Fix init order of S3C64xx's clock providers
Message-ID: <20190909184504.GA10091@kozik-lap>
References: <BY5PR12MB3699A8D741EF6226B8DB65E4C4B50@BY5PR12MB3699.namprd12.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <BY5PR12MB3699A8D741EF6226B8DB65E4C4B50@BY5PR12MB3699.namprd12.prod.outlook.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Sat, Sep 07, 2019 at 02:47:48AM +0000, Yao Lihua wrote:
> From: Lihua Yao <ylhuajnu@outlook.com>
> 
> Ensure fin_pll is initialized before clock-controller@7e00f000 so
> we have correct clock frequency like below:
> 
> [    0.000000] S3C6410 clocks: apll = 532000000, mpll = 532000000
> [    0.000000]  epll = 24000000, arm_clk = 532000000

Hi,

Unfortunately your patches missed the samsung-soc mailing list:
https://www.spinics.net/lists/linux-samsung-soc/

Maybe you need to be subscribed?

In general, if the patches are not there, I do not see them under
Patchwork. You miss also review from Samsung folks.

Best regards,
Krzysztof


> 
> Lihua Yao (2):
>   ARM: dts: s3c64xx: factor out external fixed clocks
>   ARM: dts: s3c64xx: specify dependency of clock providers
> 
>  arch/arm/boot/dts/s3c6400.dtsi         |  1 +
>  arch/arm/boot/dts/s3c6410-mini6410.dts | 22 ----------------------
>  arch/arm/boot/dts/s3c6410-smdk6410.dts | 22 ----------------------
>  arch/arm/boot/dts/s3c6410.dtsi         |  1 +
>  arch/arm/boot/dts/s3c64xx.dtsi         | 14 ++++++++++++++
>  5 files changed, 16 insertions(+), 44 deletions(-)
> 
> -- 
> 2.17.1
> 
