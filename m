Return-Path: <linux-samsung-soc+bounces-3362-lists+linux-samsung-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 54EC0908A1C
	for <lists+linux-samsung-soc@lfdr.de>; Fri, 14 Jun 2024 12:36:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BE9D61F213DC
	for <lists+linux-samsung-soc@lfdr.de>; Fri, 14 Jun 2024 10:35:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69575194A77;
	Fri, 14 Jun 2024 10:35:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ShSZl2xM"
X-Original-To: linux-samsung-soc@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47549194A4B
	for <linux-samsung-soc@vger.kernel.org>; Fri, 14 Jun 2024 10:35:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718361340; cv=none; b=EquMG46Ll3jLYTowXlwRdknynSHIANm5XBWakYGDVSI3UXleYxgxv602JkbIYjU8QOUaowbQsh20N/Atr/owdW6VCajj3APpELeCwEEg35GchRVIdGtCkwXdoyvqEQAGsi613W9u7GZRaM2Uy/goIDOqqPcE/7uMiAr1ubkkIDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718361340; c=relaxed/simple;
	bh=EiAyf1ePwV9uZg8YD0veGEI6NqoYhzoV0Z0ltj6RhI4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=np9x1dDyGtsoXmX/lI1gyqBSZ0qXE+zlLPc/6DK+O+wEKne2iaASWZl09fUbwS+PJXwmXO1kxNimXTont1mZmHy74TpvsrYFKNxrri4HlZ8y9eObTJE11gwFVThEHzj2aYud8s67iWM6SssU6ZRIY7PludAmqQMPXZgmh0WtMac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ShSZl2xM; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-52caebc6137so225446e87.0
        for <linux-samsung-soc@vger.kernel.org>; Fri, 14 Jun 2024 03:35:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718361335; x=1718966135; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=aGAN2NxY+2dqaICcDThn1Gl9L9GbHbJmWxV3worL+eg=;
        b=ShSZl2xMhkF4gfjoG5s6xSpe6i560Im5WRzuo9dUtm9moyWDGolG1E3UQj8jds1+br
         ROKm4jJKiT2JWUgTsmx5LwQ9v/QjyhdwWOeITk7sN9xLS00YrsqR7ihihwpY/I401Avn
         XffbB3itGAdXLf4ONPh9jTX2OHHn75p011xMxEG3pmRoIb/TGRjyth/LpPyW6ntLT9os
         czw49ZrLMj8ebfoqRVfts6dGvX0wh+Yq3iieRVCp8jME4ins9l3uY/z/Q02WHTMhBp+o
         sHF/PJM9LFXlFytsZYealZjfUsdXdv32dHCV/4jVC+EABhbvTdYOe63PIgNgc/N3TNHB
         KuMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718361335; x=1718966135;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aGAN2NxY+2dqaICcDThn1Gl9L9GbHbJmWxV3worL+eg=;
        b=o2qvUEeih/an/+Zt3s6P/5V2Tm+u4MrLNgYX/LYaXax+srEgDDfjrcNAxL1LpNTHLL
         szO/s8UhkuQE1dtqj9VW1g4Tsbi/77j9h8EbxzfOB098nqXSaER9s4VCPI/HlEd5WTRR
         VMp16eUL9uLkwP3bZAg9a89iZNn73y73gkoat92Zb1tuQJKAi0MHDCc734QbrFXkHa94
         we5U8jd+egJacXoDDHTOhljnUpDd5OhqR2pZMsnJ4B45bAiF5YalqqX0HKh2VUMi46+i
         RNpGJmbOZhzKT/3MgGD+ob2FOVG8soDuISRuDEaJ4FrkxysHXvIHDZZzDx+wsIYtrTvy
         vASw==
X-Forwarded-Encrypted: i=1; AJvYcCV8qWzuGaqVJwIJcoddpyJd3KejxzJW1/N4GHn55cjlZByIh83efJfvxnt6p5ZKUTySoLRdVIx0OWTRqdNY+en77T+msx8gDJf20NN1dbxrTcU=
X-Gm-Message-State: AOJu0Yxj77pPG55299scnjMueHiXPAmkB8FDSCEPlW0q260tlZlzU9or
	E8yaeTfD/kvVZqamu+ndowAx4pIyQQsjTW7sqXRCApwP+5s0NGN+yzaRuUO4nd4=
X-Google-Smtp-Source: AGHT+IG9296cngTsNvss2HWOM7KAlI/jj4Qy+Im6Q+mlyoACYXVlropKfCXjXHH3MK5suUqtTVw77g==
X-Received: by 2002:a19:f809:0:b0:52c:89ff:10bf with SMTP id 2adb3069b0e04-52ca6e999e7mr1289070e87.67.1718361335571;
        Fri, 14 Jun 2024 03:35:35 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52ca2888363sm467688e87.278.2024.06.14.03.35.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jun 2024 03:35:35 -0700 (PDT)
Date: Fri, 14 Jun 2024 13:35:33 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Guillaume La Roque <glaroque@baylibre.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Vasily Khoruzhick <anarsoul@gmail.com>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Anson Huang <Anson.Huang@nxp.com>, Thierry Reding <thierry.reding@gmail.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Amit Kucheria <amitk@kernel.org>, 
	Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, Heiko Stuebner <heiko@sntech.de>, 
	Biju Das <biju.das.jz@bp.renesas.com>, Orson Zhai <orsonzhai@gmail.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Chunyan Zhang <zhang.lyra@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Pascal Paillet <p.paillet@foss.st.com>, 
	Keerthy <j-keerthy@ti.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, zhanghongchen <zhanghongchen@loongson.cn>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Bjorn Andersson <andersson@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, linux-pm@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	imx@lists.linux.dev, linux-tegra@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-stm32@st-md-mailman.stormreply.com, Florian Fainelli <f.fainelli@gmail.com>, 
	linux-rpi-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 10/22] dt-bindings: thermal: qcom-spmi-adc-tm5: reference
 thermal-sensor schema
Message-ID: <os5vrqh7usscb2lmvwpzcea3uu2k2gbhhbfolwgoc7mc2tdjah@pt5ckx2gbfo7>
References: <20240614-dt-bindings-thermal-allof-v1-0-30b25a6ae24e@linaro.org>
 <20240614-dt-bindings-thermal-allof-v1-10-30b25a6ae24e@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240614-dt-bindings-thermal-allof-v1-10-30b25a6ae24e@linaro.org>

On Fri, Jun 14, 2024 at 11:46:09AM GMT, Krzysztof Kozlowski wrote:
> Device is a thermal sensor and it requires '#thermal-sensor-cells', so
> reference the thermal-sensor.yaml to simplify it and bring the
> common definition of '#thermal-sensor-cells' property.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  Documentation/devicetree/bindings/thermal/qcom-spmi-adc-tm5.yaml | 8 +++-----
>  1 file changed, 3 insertions(+), 5 deletions(-)
> 


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

