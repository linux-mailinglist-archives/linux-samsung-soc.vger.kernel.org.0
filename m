Return-Path: <linux-samsung-soc+bounces-678-lists+linux-samsung-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4692D812F78
	for <lists+linux-samsung-soc@lfdr.de>; Thu, 14 Dec 2023 12:53:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F0FA61F22063
	for <lists+linux-samsung-soc@lfdr.de>; Thu, 14 Dec 2023 11:53:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D31F441203;
	Thu, 14 Dec 2023 11:53:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dUcRY+xc"
X-Original-To: linux-samsung-soc@vger.kernel.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 444C1113
	for <linux-samsung-soc@vger.kernel.org>; Thu, 14 Dec 2023 03:53:36 -0800 (PST)
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-50bdec453c8so9447692e87.3
        for <linux-samsung-soc@vger.kernel.org>; Thu, 14 Dec 2023 03:53:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702554814; x=1703159614; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KttnO4PIiCaAGSytE92u74iuSMSOKJ5regNQ/EC5WuQ=;
        b=dUcRY+xcez7rKlURdw2AFGWcNBBuRihJ9ggWBlAMEw9RizFwTpyX8PyDEezOXkPFub
         Xkg/t2pA8rxDeWbxrP8RnPS5Y/2yre721nd1j/1cFbhQC+P3jrTx8ZuBn8+oeyT3NSkE
         lxsBqMDvhPASxFGvS1IusI72EXuYJdFrSHeGhTv+cLyiPXLKZz+082IjfqZWVgxQczWa
         Z1kx6ONvpsCF49wx1usk/VJmAMiDltXf1pn4Hh+idWI1V8CcGnQtO2s4uWwJVTnKu1XA
         P6n8gakR5YKuPSTLNCNPqz+DUNA2XTktgPFzrhZqeTa8at/pER4a0RV4TWwBazoywj2x
         MD8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702554814; x=1703159614;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KttnO4PIiCaAGSytE92u74iuSMSOKJ5regNQ/EC5WuQ=;
        b=k3btz19TywrYYaKvs2GsGSs0xOHxuERcou2RAoI3U67LGdAGBDxlgS/WnQhmefakMc
         4ImplwrE585T/XuHCm6/EPaNJgQFxym0qMeYkyqds9v9zlWRJqu60dHmdKcq5nCnkdck
         Z8CwJZZTX863WlUyJzAUMNsN8i8RYvmzExU16cfEX45gIo1RFYk8/g0Ywd9cVvXGfBQI
         LY+cL74oped7PiyI6mHk3zpz95WGBCeohEiLD/cO1jEL8zppnakp/KOr7JLycMPDzG88
         54P+BgEow59qmJPhI+8j0NKCkKuxR8DF23i4c/tLlDajLZJlgF/U7c5diRA4jD65dMVq
         93sg==
X-Gm-Message-State: AOJu0YzGJ1mWoQzDvLge7a5uLztghnRtDoh0yqJcpsDPphqyDk9EmoOg
	1m1Trf3qzJv+57d8DKnAEJSx/A==
X-Google-Smtp-Source: AGHT+IFKAUpNpfuAuwpUiHGvkKtTTxlNLOoY8GwwQiOzDKup6y8DvTMvl5/GS7Uobt3Q4SD5/EbY3A==
X-Received: by 2002:ac2:4219:0:b0:50b:f305:7802 with SMTP id y25-20020ac24219000000b0050bf3057802mr3932763lfh.129.1702554814419;
        Thu, 14 Dec 2023 03:53:34 -0800 (PST)
Received: from [172.30.204.158] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id y14-20020ac2446e000000b0050e1633748dsm183444lfl.206.2023.12.14.03.53.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Dec 2023 03:53:34 -0800 (PST)
Message-ID: <2890ae71-aed0-451d-a7fb-7db30c30b72b@linaro.org>
Date: Thu, 14 Dec 2023 12:53:30 +0100
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/6] arm: arm64: dts: Enable cros-ec-spi as wake source
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Mark Hasemeyer <markhas@chromium.org>, LKML <linux-kernel@vger.kernel.org>
Cc: Raul Rangel <rrangel@chromium.org>, Alim Akhtar
 <alim.akhtar@samsung.com>, Andre Przywara <andre.przywara@arm.com>,
 Andy Gross <agross@kernel.org>, Baruch Siach <baruch@tkos.co.il>,
 Bjorn Andersson <andersson@kernel.org>,
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Jesper Nilsson <jesper.nilsson@axis.com>, Jisheng Zhang
 <jszhang@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Michal Simek <michal.simek@amd.com>, Paul Barker <paul.barker@sancloud.com>,
 Rob Herring <robh+dt@kernel.org>, Sudeep Holla <sudeep.holla@arm.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 cros-qcom-dts-watchers@chromium.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-tegra@vger.kernel.org
References: <20231213110009.v1.1.Ifd0903f1c351e84376d71dbdadbd43931197f5ea@changeid>
 <20231213110009.v1.2.I274b2d2255eb539cc9d251c9d65a385cc4014c79@changeid>
 <e5625051-e9e2-4a75-a11a-cf5b40606fa4@collabora.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <e5625051-e9e2-4a75-a11a-cf5b40606fa4@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Level: *



On 12/14/23 11:55, AngeloGioacchino Del Regno wrote:
> Il 13/12/23 19:00, Mark Hasemeyer ha scritto:
>> The cros_ec driver currently assumes that cros-ec-spi compatible device
>> nodes are a wakeup-source even though the wakeup-source property is not
>> defined.
>>
>> Add the wakeup-source property to all cros-ec-spi compatible device
>> nodes to match expected behavior.
>>
>> Signed-off-by: Mark Hasemeyer <markhas@chromium.org>
> 
> I received only patch [2/6] - please send the entire series to the relevant
> maintainers, as otherwise it's difficult to understand what's going on.
> 
> As for this patch alone:
>   1. arch/arm stuff goes to a different commit
>   2. I would prefer if you split per-arch and per-SoC.
+1, otherwise *somebody* will get merge conflicts that - even
if trivial - take additional time to resolve :(

Konrad

