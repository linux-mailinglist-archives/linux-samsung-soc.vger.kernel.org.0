Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1E89B1BBB42
	for <lists+linux-samsung-soc@lfdr.de>; Tue, 28 Apr 2020 12:33:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726328AbgD1KdD (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Tue, 28 Apr 2020 06:33:03 -0400
Received: from mail-ed1-f67.google.com ([209.85.208.67]:40428 "EHLO
        mail-ed1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726276AbgD1KdD (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 28 Apr 2020 06:33:03 -0400
Received: by mail-ed1-f67.google.com with SMTP id d16so15981718edq.7;
        Tue, 28 Apr 2020 03:33:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=3D2uMdzrOa8rVE8whnBxczkr3C+t2CoAy11SOmQRQD8=;
        b=kh3V/Sxb1F3U5B/AIL8eVXrxlqactmu1bnT5rW0GEI5Pwrn2Dh6It6uWRyqcgU0gI/
         kZ2cORojJ+JsDTVypsfrncIisZn30OVc0HujLiQLcpOEU0gnvq2Nz7Dm+4qzU7LbviK6
         OnUQCGRnUyuOZrvOjT9P3XDIkqwGDz4/4cUPHjRZKH7pKK8K+Lv8lG/w4J4Z9n5hFck2
         mk3lGPUfzq4C/92ILFs4KB9SD5F+YKaPmrCYts37vBZ5FyVTESeDD8137CWwxB6s6pik
         bxlzVcmTclEuoEUae7C9Q2c1Z82ROLAMbi42JNe2YD6935Fixutis3+2I9coT10RQqV4
         YMsQ==
X-Gm-Message-State: AGi0PuaWKtZvbuU7GBFHeBfBJcpKajovRiSVvVAhcWMLAeZPK66ulR2V
        wucibn4iUEYi4lfJf7gxUFE=
X-Google-Smtp-Source: APiQypKul1M9hkner9c2dBAchlt9cSNlRgYLaNiYw2GS2Dty7nUnjKL4Mbse6v9dCx57cSCvUOLYIA==
X-Received: by 2002:a50:951c:: with SMTP id u28mr21259827eda.310.1588069980922;
        Tue, 28 Apr 2020 03:33:00 -0700 (PDT)
Received: from kozik-lap ([194.230.155.237])
        by smtp.googlemail.com with ESMTPSA id ce18sm414140ejb.61.2020.04.28.03.32.47
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 28 Apr 2020 03:33:00 -0700 (PDT)
Date:   Tue, 28 Apr 2020 12:32:27 +0200
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Jonathan Bakker <xc-racer2@live.ca>
Cc:     kgene@kernel.org, robh+dt@kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 12/13] arm: dts: s5pv210: Correct FIMC definitions
Message-ID: <20200428103227.GE23963@kozik-lap>
References: <20200426183604.28494-1-xc-racer2@live.ca>
 <BN6PR04MB0660823C87DE000BCDF36C3AA3AE0@BN6PR04MB0660.namprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <BN6PR04MB0660823C87DE000BCDF36C3AA3AE0@BN6PR04MB0660.namprd04.prod.outlook.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Sun, Apr 26, 2020 at 11:36:03AM -0700, Jonathan Bakker wrote:
> The extended mainscaler is only available on FIMC1 and there
> are minimum pixel alignments that differ from the default.
> Additionally, the cam-if interface is available on all three
> while FIMC2 has no rotators.  The lcd-wb interface is supported
> on FIMC1.
> 
> Signed-off-by: Jonathan Bakker <xc-racer2@live.ca>
> ---
>  arch/arm/boot/dts/s5pv210.dtsi | 13 ++++++++-----
>  1 file changed, 8 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/s5pv210.dtsi b/arch/arm/boot/dts/s5pv210.dtsi
> index b3b6ad2889f9..3cbf6c05f42a 100644
> --- a/arch/arm/boot/dts/s5pv210.dtsi
> +++ b/arch/arm/boot/dts/s5pv210.dtsi
> @@ -626,7 +626,7 @@
>  				clock-names = "fimc",
>  						"sclk_fimc";
>  				samsung,pix-limits = <4224 8192 1920 4224>;
> -				samsung,mainscaler-ext;
> +				samsung,min-pix-alignment = <16 8>;
>  				samsung,cam-if;
>  			};
>  
> @@ -639,9 +639,11 @@
>  						<&clocks SCLK_FIMC1>;
>  				clock-names = "fimc",
>  						"sclk_fimc";
> -				samsung,pix-limits = <4224 8192 1920 4224>;
>  				samsung,mainscaler-ext;
> +				samsung,min-pix-alignment = <1 1>;
> +				samsung,pix-limits = <4224 8192 1920 4224>;

The line just moved around. I guess this was not intended?

Best regards,
Krzysztof

>  				samsung,cam-if;
> +				samsung,lcd-wb;
>  			};
>  
>  			fimc2: fimc@fb400000 {
> @@ -653,9 +655,10 @@
>  						<&clocks SCLK_FIMC2>;
>  				clock-names = "fimc",
>  						"sclk_fimc";
> -				samsung,pix-limits = <4224 8192 1920 4224>;
> -				samsung,mainscaler-ext;
> -				samsung,lcd-wb;
> +				samsung,pix-limits = <1920 8192 1280 1920>;
> +				samsung,min-pix-alignment = <16 8>;
> +				samsung,rotators = <0>;
> +				samsung,cam-if;
>  			};
>  		};
>  
> -- 
> 2.20.1
> 
