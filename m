Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7AC7C47A75
	for <lists+linux-samsung-soc@lfdr.de>; Mon, 17 Jun 2019 09:12:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725837AbfFQHMS (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Mon, 17 Jun 2019 03:12:18 -0400
Received: from mail.kernel.org ([198.145.29.99]:51576 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725826AbfFQHMS (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 17 Jun 2019 03:12:18 -0400
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 15848218EA;
        Mon, 17 Jun 2019 07:12:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1560755536;
        bh=auAmcgDb9/BI7xXD6SFrnCeWwfBK8vq66znDTU/qxiE=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=Qs2uqqAu8v+vqQAIjksCHS2nPH9Zl4cZ+Ai0T1xtiD9snX6vO+jyYNN1d0e0gSq92
         ILe9zqcpQL1wTn5pqSUWgIdYvGceHH+DhjfAkg9ezLxnrQyw9ZIEsEHnQmO1vj6Mfv
         YYur0sZUvJzSPFlG2FUf9dKL3kAPlBNbkQaa7PDc=
Received: by mail-lj1-f173.google.com with SMTP id t28so8182108lje.9;
        Mon, 17 Jun 2019 00:12:16 -0700 (PDT)
X-Gm-Message-State: APjAAAXgsGofpJQvsq6vKf0/ODYJGNYSx8274opu8W4fXfu/G0cIS4Q1
        MHWzS4iZj2CYrfdeJaWFVb8pdbsB7qDyOI7JjjI=
X-Google-Smtp-Source: APXvYqxYdWi6u8+Af9xm4Ixw0NW9S2cn6fHEduei34f452pIJ4bgKmwQXZSGCJoSV5lYo97OVcCtb7ZtQ5e1o/emiPw=
X-Received: by 2002:a2e:94c9:: with SMTP id r9mr12365447ljh.210.1560755534293;
 Mon, 17 Jun 2019 00:12:14 -0700 (PDT)
MIME-Version: 1.0
References: <20190614163635.22413-1-enric.balletbo@collabora.com> <20190614163635.22413-11-enric.balletbo@collabora.com>
In-Reply-To: <20190614163635.22413-11-enric.balletbo@collabora.com>
From:   Krzysztof Kozlowski <krzk@kernel.org>
Date:   Mon, 17 Jun 2019 09:12:03 +0200
X-Gmail-Original-Message-ID: <CAJKOXPetaMmeQyZWVWRUSzbe1pKMweCpUx=phy8QowVQHTrdLA@mail.gmail.com>
Message-ID: <CAJKOXPetaMmeQyZWVWRUSzbe1pKMweCpUx=phy8QowVQHTrdLA@mail.gmail.com>
Subject: Re: [PATCH v2 10/10] arm/arm64: defconfig: Update configs to use the
 new CROS_EC options
To:     Enric Balletbo i Serra <enric.balletbo@collabora.com>
Cc:     linux-kernel@vger.kernel.org, gwendal@chromium.org,
        Guenter Roeck <groeck@chromium.org>,
        Benson Leung <bleung@chromium.org>,
        Lee Jones <lee.jones@linaro.org>, kernel@collabora.com,
        dtor@chromium.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        "linux-samsung-soc@vger.kernel.org" 
        <linux-samsung-soc@vger.kernel.org>,
        Olof Johansson <olof@lixom.net>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Dinh Nguyen <dinguyen@kernel.org>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Will Deacon <will.deacon@arm.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Kukjin Kim <kgene@kernel.org>,
        Jagan Teki <jagan@amarulasolutions.com>,
        Daniel Mack <daniel@zonque.org>,
        Russell King <linux@armlinux.org.uk>,
        linux-arm-kernel@lists.infradead.org,
        Simon Horman <horms+renesas@verge.net.au>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        =?UTF-8?Q?Yannick_Fertr=C3=A9?= <yannick.fertre@st.com>,
        Robert Jarzmik <robert.jarzmik@free.fr>,
        Tony Lindgren <tony@atomide.com>,
        Alexandre Torgue <alexandre.torgue@st.com>,
        Maxime Ripard <maxime.ripard@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Fri, 14 Jun 2019 at 18:37, Enric Balletbo i Serra
<enric.balletbo@collabora.com> wrote:
>
> Recently we refactored the CrOS EC drivers moving part of the code from
> the MFD subsystem to the platform chrome subsystem. During this change
> we needed to rename some config options, so, update the defconfigs
> accordingly.
>
> Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
> ---
>
> Changes in v2: None
>
>  arch/arm/configs/exynos_defconfig   | 4 +++-
>  arch/arm/configs/multi_v7_defconfig | 6 ++++--
>  arch/arm/configs/pxa_defconfig      | 4 +++-
>  arch/arm64/configs/defconfig        | 6 ++++--
>  4 files changed, 14 insertions(+), 6 deletions(-)
>
> diff --git a/arch/arm/configs/exynos_defconfig b/arch/arm/configs/exynos_defconfig
> index c95c54284da2..03448fba569f 100644
> --- a/arch/arm/configs/exynos_defconfig
> +++ b/arch/arm/configs/exynos_defconfig
> @@ -154,7 +154,9 @@ CONFIG_CPU_THERMAL=y
>  CONFIG_THERMAL_EMULATION=y
>  CONFIG_WATCHDOG=y
>  CONFIG_S3C2410_WATCHDOG=y
> -CONFIG_MFD_CROS_EC=y
> +CONFIG_MFD_CROS_EC_DEV=y
> +CONFIG_CHROME_PLATFORMS=y
> +CONFIG_CROS_EC=y
>  CONFIG_CROS_EC_I2C=y
>  CONFIG_CROS_EC_SPI=y
>  CONFIG_MFD_MAX14577=y

If you want to take it through mfd, arm-soc or other tree:
For Exynos:
Acked-by: Krzysztof Kozlowski <krzk@kernel.org>

Otherwise I could take exynos/multi_v7/arm64 changes but split per arm v7/v8.

Best regards,
Krzysztof


> diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
> index 6b748f214eae..9fe783abf3c5 100644
> --- a/arch/arm/configs/multi_v7_defconfig
> +++ b/arch/arm/configs/multi_v7_defconfig
> @@ -510,10 +510,12 @@ CONFIG_MFD_BCM590XX=y
>  CONFIG_MFD_AC100=y
>  CONFIG_MFD_AXP20X_I2C=y
>  CONFIG_MFD_AXP20X_RSB=y
> -CONFIG_MFD_CROS_EC=m
> +CONFIG_MFD_CROS_EC_DEV=m
> +CONFIG_CHROME_PLATFORMS=y
> +CONFIG_CROS_EC=m
>  CONFIG_CROS_EC_I2C=m
>  CONFIG_CROS_EC_SPI=m
> -CONFIG_MFD_CROS_EC_CHARDEV=m
> +CONFIG_CROS_EC_CHARDEV=m
>  CONFIG_MFD_DA9063=m
>  CONFIG_MFD_MAX14577=y
>  CONFIG_MFD_MAX77686=y
> diff --git a/arch/arm/configs/pxa_defconfig b/arch/arm/configs/pxa_defconfig
> index 07ebbdce3645..e335b986cf70 100644
> --- a/arch/arm/configs/pxa_defconfig
> +++ b/arch/arm/configs/pxa_defconfig
> @@ -394,7 +394,9 @@ CONFIG_SA1100_WATCHDOG=m
>  CONFIG_MFD_AS3711=y
>  CONFIG_MFD_BCM590XX=m
>  CONFIG_MFD_AXP20X=y
> -CONFIG_MFD_CROS_EC=m
> +CONFIG_MFD_CROS_EC_DEV=m
> +CONFIG_CHROME_PLATFORMS=y
> +CONFIG_CROS_EC=m
>  CONFIG_CROS_EC_I2C=m
>  CONFIG_CROS_EC_SPI=m
>  CONFIG_MFD_ASIC3=y
> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> index 4d583514258c..b5bba5f04082 100644
> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
> @@ -430,8 +430,7 @@ CONFIG_MFD_ALTERA_SYSMGR=y
>  CONFIG_MFD_BD9571MWV=y
>  CONFIG_MFD_AXP20X_I2C=y
>  CONFIG_MFD_AXP20X_RSB=y
> -CONFIG_MFD_CROS_EC=y
> -CONFIG_MFD_CROS_EC_CHARDEV=m
> +CONFIG_MFD_CROS_EC_DEV=y
>  CONFIG_MFD_EXYNOS_LPASS=m
>  CONFIG_MFD_HI6421_PMIC=y
>  CONFIG_MFD_HI655X_PMIC=y
> @@ -631,8 +630,11 @@ CONFIG_VIRTIO_BALLOON=y
>  CONFIG_VIRTIO_MMIO=y
>  CONFIG_XEN_GNTDEV=y
>  CONFIG_XEN_GRANT_DEV_ALLOC=y
> +CONFIG_CHROME_PLATFORMS=y
> +CONFIG_CROS_EC=y
>  CONFIG_CROS_EC_I2C=y
>  CONFIG_CROS_EC_SPI=y
> +CONFIG_CROS_EC_CHARDEV=m
>  CONFIG_COMMON_CLK_RK808=y
>  CONFIG_COMMON_CLK_SCPI=y
>  CONFIG_COMMON_CLK_CS2000_CP=y
> --
> 2.20.1
>
