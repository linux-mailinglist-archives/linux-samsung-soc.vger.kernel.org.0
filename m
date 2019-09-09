Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0ECF7ADF27
	for <lists+linux-samsung-soc@lfdr.de>; Mon,  9 Sep 2019 20:53:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726565AbfIISxs (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Mon, 9 Sep 2019 14:53:48 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:42986 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727818AbfIISxs (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 9 Sep 2019 14:53:48 -0400
Received: by mail-wr1-f65.google.com with SMTP id q14so15249587wrm.9
        for <linux-samsung-soc@vger.kernel.org>; Mon, 09 Sep 2019 11:53:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=CwHYXxof8Php+/UN1FeQs9EQLGPhSRQiZ+KCEvXPatU=;
        b=Il/YT/QKC58Ha83JSuqDoZhzH9kexFg+gkf2lKI9EaWJ59gclp9em3BOU4PvCDo14m
         o4o0Vfk4KHualomWFhTkJrISejyfrFddeh0fZlaY1S3AZuLn9p2q2WvpEC2sMlt9bpBJ
         KmCWYERjKKbkGHkVYB7FPA5ROPE23YwOjexzxtNNSPX05eQZrx5cdB8sS/d4cy143ZXd
         i6pjb2Lm8TCbLgOlrSk5HrP2VXVA6PkaVgnvPopSjQ2C25ZK0STFg/mMxS79YywR4cN0
         TMcc9Lgr2OF8yPYCE4Qer11YwES3VqHKWYVZgUelYnG0pUQ3KjZGsWHalFkgspT3VBL+
         J61g==
X-Gm-Message-State: APjAAAXAPDQXl6Nc+IWYf/X6QYdiNIeo+rQVB+7AS3sOiQNXVAzjX8rc
        8vTrP0BJzTVDaiI8oyNJB5I=
X-Google-Smtp-Source: APXvYqygDZqRMWLJ4M5iQcM6jFXigiv0dCcQqevTZr4XkGXmJwUFf/iXq+yauwCiU4ZdfdhJmooG6g==
X-Received: by 2002:adf:e612:: with SMTP id p18mr1091103wrm.218.1568055225699;
        Mon, 09 Sep 2019 11:53:45 -0700 (PDT)
Received: from kozik-lap ([194.230.155.145])
        by smtp.googlemail.com with ESMTPSA id q26sm458534wmf.45.2019.09.09.11.53.44
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 09 Sep 2019 11:53:45 -0700 (PDT)
Date:   Mon, 9 Sep 2019 20:53:43 +0200
From:   "krzk@kernel.org" <krzk@kernel.org>
To:     Yao Lihua <ylhuajnu@outlook.com>
Cc:     "kgene@kernel.org" <kgene@kernel.org>,
        "linux-samsung-soc@vger.kernel.org" 
        <linux-samsung-soc@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH 2/2] ARM: dts: s3c64xx: specify dependency of clock
 providers
Message-ID: <20190909185343.GB10091@kozik-lap>
References: <20190907024719.16974-1-ylhuajnu@outlook.com>
 <BY5PR12MB36991E62DD57AA6962C05420C4B50@BY5PR12MB3699.namprd12.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <BY5PR12MB36991E62DD57AA6962C05420C4B50@BY5PR12MB3699.namprd12.prod.outlook.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Sat, Sep 07, 2019 at 02:48:12AM +0000, Yao Lihua wrote:
> From: Lihua Yao <ylhuajnu@outlook.com>
> 
> fin_pll is the parent of clock-controller@7e00f000, specify
> the dependency to ensure proper initialization order of clock
> providers.
> 
> Fixes: 3f6d439f2022 ("clk: reverse default clk provider initialization order in of_clk_init()")
> Signed-off-by: Lihua Yao <ylhuajnu@outlook.com>
> ---
>  arch/arm/boot/dts/s3c6400.dtsi | 1 +
>  arch/arm/boot/dts/s3c6410.dtsi | 1 +
>  2 files changed, 2 insertions(+)

Idea looks good but should go to each of DTS files.

Best regards,
Krzysztof

> 
> diff --git a/arch/arm/boot/dts/s3c6400.dtsi b/arch/arm/boot/dts/s3c6400.dtsi
> index 8c28e8a0c824..ef5a8fa3555c 100644
> --- a/arch/arm/boot/dts/s3c6400.dtsi
> +++ b/arch/arm/boot/dts/s3c6400.dtsi
> @@ -34,5 +34,6 @@
>  		compatible = "samsung,s3c6400-clock";
>  		reg = <0x7e00f000 0x1000>;
>  		#clock-cells = <1>;
> +		clocks = <&fin_pll>;
>  	};
>  };
> diff --git a/arch/arm/boot/dts/s3c6410.dtsi b/arch/arm/boot/dts/s3c6410.dtsi
> index a766d6de696c..b201b71d45b5 100644
> --- a/arch/arm/boot/dts/s3c6410.dtsi
> +++ b/arch/arm/boot/dts/s3c6410.dtsi
> @@ -38,6 +38,7 @@
>  		compatible = "samsung,s3c6410-clock";
>  		reg = <0x7e00f000 0x1000>;
>  		#clock-cells = <1>;
> +		clocks = <&fin_pll>;
>  	};
>  
>  	i2c1: i2c@7f00f000 {
> -- 
> 2.17.1
> 
