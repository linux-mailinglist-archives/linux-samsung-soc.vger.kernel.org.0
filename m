Return-Path: <linux-samsung-soc+bounces-225-lists+linux-samsung-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 930087FCFED
	for <lists+linux-samsung-soc@lfdr.de>; Wed, 29 Nov 2023 08:29:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C6C78B213A9
	for <lists+linux-samsung-soc@lfdr.de>; Wed, 29 Nov 2023 07:29:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51A4510975;
	Wed, 29 Nov 2023 07:29:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-samsung-soc@vger.kernel.org
Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 64230DA;
	Tue, 28 Nov 2023 23:29:39 -0800 (PST)
Received: from francesco-nb.int.toradex.com (31-10-206-125.static.upc.ch [31.10.206.125])
	by mail11.truemail.it (Postfix) with ESMTPA id 3023420395;
	Wed, 29 Nov 2023 08:29:36 +0100 (CET)
Date: Wed, 29 Nov 2023 08:29:30 +0100
From: Francesco Dolcini <francesco@dolcini.it>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, Andrew Davis <afd@ti.com>,
	Andrew Lunn <andrew@lunn.ch>, Arnd Bergmann <arnd@arndb.de>,
	Bjorn Andersson <andersson@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Heiko Stuebner <heiko@sntech.de>, Jonathan Corbet <corbet@lwn.net>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Michal Simek <michal.simek@amd.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Nishanth Menon <nm@ti.com>, Olof Johansson <olof@lixom.net>,
	=?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
	linux-rockchip@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-amlogic@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	workflows@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH v3] docs: dt-bindings: add DTS Coding Style document
Message-ID: <ZWboWqELHbIrblnz@francesco-nb.int.toradex.com>
References: <20231125184422.12315-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231125184422.12315-1-krzysztof.kozlowski@linaro.org>

On Sat, Nov 25, 2023 at 07:44:22PM +0100, Krzysztof Kozlowski wrote:
> Document preferred coding style for Devicetree sources (DTS and DTSI),
> to bring consistency among all (sub)architectures and ease in reviews.

Thank Krzysztof, we had most of this collected as BKM in some internal
documents and it's great to see the effort to consolidate this and add
it to the kernel documentation.

> ---
> +Following order of properties in device nodes is preferred:
> +
> +1. compatible
> +2. reg
> +3. ranges
> +4. Standard/common properties (defined by common bindings, e.g. without
> +   vendor-prefixes)
> +5. Vendor-specific properties
> +6. status (if applicable)
> +7. Child nodes, where each node is preceded with a blank line

On point 4, do you have a more explicit way to define what is an actual
standard/common property? You mention the vendor-prefixes as an example,
is this just an example or this is the whole definition?

What would be the order for this for example (from an existing DTS file)?

	reg_sdhc1_vmmc: regulator-sdhci1 {
		compatible = "regulator-fixed";
		pinctrl-names = "default";
		pinctrl-0 = <&pinctrl_sd1_pwr_en>;
		enable-active-high;
		gpio = <&main_gpio0 29 GPIO_ACTIVE_HIGH>;
		off-on-delay-us = <100000>;
		regulator-max-microvolt = <3300000>;
		regulator-min-microvolt = <3300000>;
		regulator-name = "+V3.3_SD";
		startup-delay-us = <2000>;
	};

I guess the point that is not obvious to me here is where do we want
pinctrl. I like it at position between 3 and 4, the rationale is that is
a very frequent property and this way it will be in a similar place for
every node.

Francesco


