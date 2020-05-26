Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0F6341A33DF
	for <lists+linux-samsung-soc@lfdr.de>; Thu,  9 Apr 2020 14:14:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726470AbgDIMOj (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Thu, 9 Apr 2020 08:14:39 -0400
Received: from mail-ed1-f67.google.com ([209.85.208.67]:46176 "EHLO
        mail-ed1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725971AbgDIMOj (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 9 Apr 2020 08:14:39 -0400
Received: by mail-ed1-f67.google.com with SMTP id dk4so1560333edb.13;
        Thu, 09 Apr 2020 05:14:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=gjEM13EEF7k1kbQW2kuKohhF4C6T/w7Fwh7P4gFdLqA=;
        b=I4LNnoXz1z0gieIsGitYgwO+1sflmuUCL98wdt8mAlA0Hzkk2Pi0D3U5xfdXqOjQyX
         BAkfocMeOVQsj8A3wGPvXwVwueao2TbraV6SNJCUO1R+e1/0oeU8e8lQblpt/scPQt5t
         x9uIbpNBl3AriaoWJO3IqwQzARZPv5Oh05G6BBjzGY4orbiY0DoOFGwi6CYAyDYnxxKB
         23wYNsm2kXXXASr/kpXbxL9w/OLDK0AthcvINkdvJLwRx0GNyzP1AcnQoE8TFNcdZQJO
         UesApie1Ada8sRCaEy/6aitCX2Hyz72FDhgQf90s82kT1nb8e/Hviwa4T5rZcDdGfO9x
         SRnQ==
X-Gm-Message-State: AGi0PuboaxMNjsYmRZgGuBbBdazP2gJ6C+ebwmC2352XIrBRZHN5Tgoi
        dqA+WZzhNKtzhv/TTvwhnLk=
X-Google-Smtp-Source: APiQypLiKWNSVqSQqzEU1uEC5Rj3p/l7GJLgM9883/Bzide7ODn4Zj6pkixK6wZWrnVqtCwUfOA5sQ==
X-Received: by 2002:a50:ee82:: with SMTP id f2mr10974652edr.208.1586434476649;
        Thu, 09 Apr 2020 05:14:36 -0700 (PDT)
Received: from kozik-lap ([194.230.155.125])
        by smtp.googlemail.com with ESMTPSA id a17sm3035898edj.53.2020.04.09.05.14.34
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 09 Apr 2020 05:14:35 -0700 (PDT)
Date:   Thu, 9 Apr 2020 14:14:32 +0200
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Oleksandr Suvorov <oleksandr.suvorov@toradex.com>
Cc:     devicetree@vger.kernel.org, Paul Barker <pbarker@konsulko.com>,
        Marcel Ziswiler <marcel.ziswiler@toradex.com>,
        Igor Opaniuk <igor.opaniuk@toradex.com>,
        Philippe Schenker <philippe.schenker@toradex.com>,
        Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Andrius =?utf-8?B?xaB0aWtvbmFz?= <andrius@stikonas.eu>,
        Andy Yan <andy.yan@rock-chips.com>,
        Chen-Yu Tsai <wens@csie.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Hugh Cole-Baker <sigmaris@gmail.com>,
        Jagan Teki <jagan@amarulasolutions.com>,
        Johan Jonker <jbx6244@gmail.com>,
        Katsuhiro Suzuki <katsuhiro@katsuster.net>,
        Kever Yang <kever.yang@rock-chips.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Kukjin Kim <kgene@kernel.org>,
        Markus Reichl <m.reichl@fivetechno.de>,
        Maxime Ripard <mripard@kernel.org>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Nick Xie <nick@khadas.com>, Rob Herring <robh+dt@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Soeren Moch <smoch@web.de>, linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-rockchip@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
Subject: Re: [RFC PATCH v2 4/6] arm64: dts: pwm: replace flag 0 with
 PWM_NOFLAGS
Message-ID: <20200409121432.GA802@kozik-lap>
References: <20200405192246.3741784-1-oleksandr.suvorov@toradex.com>
 <20200405192246.3741784-5-oleksandr.suvorov@toradex.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200405192246.3741784-5-oleksandr.suvorov@toradex.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Sun, Apr 05, 2020 at 10:22:44PM +0300, Oleksandr Suvorov wrote:
> The raw value '0' in the 3rd cell of the "pwms" property means there are
> no flags to be set.
> 
> This patch converts '0' flag into PWM_NOFLAGS.
> 
> Signed-off-by: Oleksandr Suvorov <oleksandr.suvorov@toradex.com>
> ---
> 
> Changes in v2:
> - Use PWM_NOFLAGS instead of PWM_POLARITY_NORMAL to avoid possible
>   conflict with enum pwm_polarity in <linux/pwm.h>. Also, this name
>   reflects the sense of this value more precisely.
> 
>  arch/arm64/boot/dts/allwinner/sun50i-a64-pinebook.dts      | 2 +-
>  arch/arm64/boot/dts/allwinner/sun50i-a64-teres-i.dts       | 2 +-
>  arch/arm64/boot/dts/amlogic/meson-axg-s400.dts             | 3 ++-
>  arch/arm64/boot/dts/amlogic/meson-axg.dtsi                 | 1 +
>  arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi          | 1 +
>  arch/arm64/boot/dts/amlogic/meson-g12a-sei510.dts          | 5 +++--
>  arch/arm64/boot/dts/amlogic/meson-g12a-u200.dts            | 2 +-
>  arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts         | 5 +++--
>  arch/arm64/boot/dts/amlogic/meson-g12b-khadas-vim3.dtsi    | 4 ++--
>  arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dts       | 4 ++--
>  arch/arm64/boot/dts/amlogic/meson-g12b-ugoos-am6.dts       | 7 ++++---
>  arch/arm64/boot/dts/amlogic/meson-gx-p23x-q20x.dtsi        | 3 ++-
>  arch/arm64/boot/dts/amlogic/meson-gx.dtsi                  | 1 +
>  arch/arm64/boot/dts/amlogic/meson-gxbb-nanopi-k2.dts       | 3 ++-
>  arch/arm64/boot/dts/amlogic/meson-gxbb-nexbox-a95x.dts     | 3 ++-
>  arch/arm64/boot/dts/amlogic/meson-gxbb-p20x.dtsi           | 3 ++-
>  arch/arm64/boot/dts/amlogic/meson-gxbb-vega-s95.dtsi       | 3 ++-
>  arch/arm64/boot/dts/amlogic/meson-gxbb-wetek.dtsi          | 3 ++-
>  arch/arm64/boot/dts/amlogic/meson-gxl-s805x-p241.dts       | 3 ++-
>  .../boot/dts/amlogic/meson-gxl-s905x-hwacom-amazetv.dts    | 3 ++-
>  arch/arm64/boot/dts/amlogic/meson-gxl-s905x-khadas-vim.dts | 2 +-
>  .../arm64/boot/dts/amlogic/meson-gxl-s905x-nexbox-a95x.dts | 3 ++-
>  arch/arm64/boot/dts/amlogic/meson-gxl-s905x-p212.dtsi      | 3 ++-
>  arch/arm64/boot/dts/amlogic/meson-gxm-khadas-vim2.dts      | 5 +++--
>  arch/arm64/boot/dts/amlogic/meson-gxm-rbox-pro.dts         | 3 ++-
>  arch/arm64/boot/dts/amlogic/meson-khadas-vim3.dtsi         | 4 +++-
>  arch/arm64/boot/dts/amlogic/meson-sm1-khadas-vim3l.dts     | 2 +-
>  arch/arm64/boot/dts/amlogic/meson-sm1-sei610.dts           | 7 ++++---
>  arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi      | 3 ++-

I understand you are going to push it through arm-soc, so:
For Exynos:
Acked-by: Krzysztof Kozlowski <krzk@kernel.org>

Otherwise if you expect individual maintainers to pick it up, please
split per architecture.

Best regards,
Krzysztof
