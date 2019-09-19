Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 817B2B750F
	for <lists+linux-samsung-soc@lfdr.de>; Thu, 19 Sep 2019 10:26:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388194AbfISI01 (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Thu, 19 Sep 2019 04:26:27 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:52103 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387637AbfISI01 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 19 Sep 2019 04:26:27 -0400
Received: by mail-wm1-f68.google.com with SMTP id 7so3307285wme.1;
        Thu, 19 Sep 2019 01:26:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=5Kix1vWVqgxCmDUQkxBHf8UbEBayBPaxaHrzjCVpKWE=;
        b=ce2h2urm0BT/r5eyMurKA7qfFd6wGAJFR6zPhkqRnPmbZtOW/VT/R6fLv4O1xfXrFv
         OP86NKpmmcy+NnU6SFTOJ5mpwPosE7xMPynOU0IemfRqVKcAghoZFkP5n4WEgQJuwLnK
         AHWxGr7J4oQbowB9QaolKW04uX487mgh0cbwFW9QOeeeYK0mOHnqrOWGQyAkIP9h8ws+
         faZBiKuiTtAL1LexOn3h9p1YdOI1OTkMh3KKbspplr7+VrorkeT3eQeYdwb1F3388Z6f
         /Qmj39uVfHUuNuE8/wCKpqbI7IUOatwDI/MPtNKqyyr7J3SWSiWud0UM1EBzaF81282Z
         oNIw==
X-Gm-Message-State: APjAAAVee7PQSkf9zxZGYaQ7J10x6Ar2yYTH65IiTwmW0UhpbhUimi4n
        ltbTuhgcdbmUijZx5ZxyQwg=
X-Google-Smtp-Source: APXvYqzzWYQAyNSPK0OicTAv83TGfnT3qvETBNRtC/3D58bfQtSXgxXkEDBhiDTK0t/7qWUw8Q38HA==
X-Received: by 2002:a1c:d188:: with SMTP id i130mr1738494wmg.101.1568881585095;
        Thu, 19 Sep 2019 01:26:25 -0700 (PDT)
Received: from pi3 ([194.230.155.145])
        by smtp.googlemail.com with ESMTPSA id n7sm2737843wrt.59.2019.09.19.01.26.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Sep 2019 01:26:24 -0700 (PDT)
Date:   Thu, 19 Sep 2019 10:26:21 +0200
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc:     broonie@kernel.org, lgirdwood@gmail.com,
        ckeepax@opensource.cirrus.com, sbkim73@samsung.com,
        alsa-devel@alsa-project.org, robh+dt@kernel.org,
        devicetree@vger.kernel.org, patches@opensource.cirrus.com,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, b.zolnierkie@samsung.com,
        m.szyprowski@samsung.com
Subject: Re: [PATCH v1 9/9] ARM: dts: arndale: Add audio support (WM1811
 CODEC boards)
Message-ID: <20190919082621.GG13195@pi3>
References: <20190918104634.15216-1-s.nawrocki@samsung.com>
 <CGME20190918104715eucas1p2a051a537a0e86becfbbcb36c172ef705@eucas1p2.samsung.com>
 <20190918104634.15216-10-s.nawrocki@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20190918104634.15216-10-s.nawrocki@samsung.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Wed, Sep 18, 2019 at 12:46:34PM +0200, Sylwester Nawrocki wrote:
> Add sound node and the clock configurations for the I2S controller
> for audio support on the Exynos5250 SoC Arndale boards with
> WM1811 based audio daugther board.
> 
> We need to increase drive strength of the I2S bus, otherwise
> the audio CODEC doesn't work. Likely the CODEC's master clock
> is the main issue here.
> 
> Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
> ---
>  arch/arm/boot/dts/exynos5250-arndale.dts | 27 +++++++++++++++++++++++-
>  1 file changed, 26 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm/boot/dts/exynos5250-arndale.dts b/arch/arm/boot/dts/exynos5250-arndale.dts
> index dc6fa6fe83f1..62aa6720aa88 100644
> --- a/arch/arm/boot/dts/exynos5250-arndale.dts
> +++ b/arch/arm/boot/dts/exynos5250-arndale.dts
> @@ -11,6 +11,7 @@
>  #include <dt-bindings/interrupt-controller/irq.h>
>  #include <dt-bindings/input/input.h>
>  #include <dt-bindings/clock/samsung,s2mps11.h>
> +#include <dt-bindings/sound/samsung-i2s.h>
>  #include "exynos5250.dtsi"
>  
>  / {
> @@ -135,6 +136,12 @@
>  		};
>  	};
>  
> +	sound {
> +		compatible = "samsung,arndale-wm1811";
> +		samsung,audio-cpu = <&i2s0>;
> +		samsung,audio-codec = <&wm1811>;
> +	};
> +
>  	fixed-rate-clocks {
>  		xxti {
>  			compatible = "samsung,clock-xxti";
> @@ -499,12 +506,24 @@
>  	};
>  };
>  
> +&clock {
> +	assigned-clocks = <&clock CLK_FOUT_EPLL>;
> +	assigned-clock-rates = <49152000>;
> +};
> +
> +&clock_audss {
> +	assigned-clocks = <&clock_audss EXYNOS_MOUT_AUDSS>;
> +	assigned-clock-parents = <&clock CLK_FOUT_EPLL>;
> +};

Put them before "cpu" so alphabetical order is preserved.

Best regards,
Krzysztof

> +
>  &i2c_3 {
>  	status = "okay";
>  
> -	wm1811a@1a {
> +	wm1811: codec@1a {
>  		compatible = "wlf,wm1811";
>  		reg = <0x1a>;
> +		clocks = <&i2s0 CLK_I2S_CDCLK>;
> +		clock-names = "MCLK1";
>  
>  		AVDD2-supply = <&main_dc_reg>;
>  		CPVDD-supply = <&main_dc_reg>;
> @@ -540,9 +559,15 @@
>  };
>  
>  &i2s0 {
> +	assigned-clocks = <&i2s0 CLK_I2S_RCLK_SRC>;
> +	assigned-clock-parents = <&clock_audss EXYNOS_I2S_BUS>;
>  	status = "okay";
>  };
>  
> +&i2s0_bus {
> +	samsung,pin-drv = <EXYNOS4_PIN_DRV_LV2>;
> +};
> +
>  &mixer {
>  	status = "okay";
>  };
> -- 
> 2.17.1
> 
