Return-Path: <linux-samsung-soc+bounces-1401-lists+linux-samsung-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E93083E68E
	for <lists+linux-samsung-soc@lfdr.de>; Sat, 27 Jan 2024 00:19:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EEAF628D030
	for <lists+linux-samsung-soc@lfdr.de>; Fri, 26 Jan 2024 23:19:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B77D2605CF;
	Fri, 26 Jan 2024 23:16:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="JWNTWK01"
X-Original-To: linux-samsung-soc@vger.kernel.org
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75EBC5C8E4
	for <linux-samsung-soc@vger.kernel.org>; Fri, 26 Jan 2024 23:16:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706310975; cv=none; b=uN6MOmNIp4/PCLMIj+mHu7vnSuYdvKsj1TFsClmZvWN0BAWw4Q0E9kkipq53bskeVuNWAz1ANbWfzMsTbIDhZpV9JuB6v9VkNVexcpAwM0GlarH/EnoxEoB3vo17DvNI5FwnRtq1m/gEdsdzVadhRkUFn7y3rsapm4Cyrn2+Txg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706310975; c=relaxed/simple;
	bh=ewPqTDJUBftEDpihVt9+vlqkTpp6AexDsJM1tz2Udmc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Oh//PEgmQWH+AvYXUd1i8ws/9Aexqa3PUswyYYFCawd9NWQhlbcvNoYkAo2IPpG7bP6tL0SkjZVfhIGbhurL+YwWbxpMnYQ4U+sRHos+6jWURNs2rNf5+cBbRqoWaqDTNXL+GkJ++lWh8zMzJ139vseoA14z5cxxxDhnkgFYfFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=JWNTWK01; arc=none smtp.client-ip=209.85.222.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-7831806c51bso75185685a.1
        for <linux-samsung-soc@vger.kernel.org>; Fri, 26 Jan 2024 15:16:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1706310972; x=1706915772; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N1vQJsjbXwMoV42WRJ/mwpke5D4/XsDiuadCHfD7OFk=;
        b=JWNTWK01ByKfjwUiUGQiNdDamXdhWY7L5zeve2AmBdi5adosdyPav9ABjY5wB919JL
         MIDpe00vcrCS9vjxPGIZgDAfp0kc3/x3FIc0cZYykEg/Fk0fBX27FiJSNJPfDByqE3TI
         bGBzjeTkBwgm55iQqC3CG+rMIvUg2EloMzO/I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706310972; x=1706915772;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N1vQJsjbXwMoV42WRJ/mwpke5D4/XsDiuadCHfD7OFk=;
        b=n2wjZcSSTaT5ezME6hpi7jswccPZZty3zU+fxIc583vbvCv/hDfbV6nUgyglFxa3N2
         yf8tHWiIj3i64scltwNqEMfLDIfpp0S2i5Zz5glaFqSg+Q2Y2UL6Vnw5kxxDSYxb1uyB
         r8eh1prbXDA2GtRcPB9Ltq+mfdWURZKcZlME3VF7y+dDXc8zuI9SEMc2nKYJePCTuuvL
         7dCvtAFq/MiUWfnHt1BbDFKHCK4Vc7MSc4wcfMwEQKOF8h34DKq+DipmgbpTqT4oaFh0
         Vv1nVhN0g9gupnNYbUFgzCEVxtz0FX3TsoNhRpUtK72NRuf/PckBUw7UrS8I3tepuQ1U
         l70g==
X-Gm-Message-State: AOJu0Yw7lw/zgB67b/Pumsj1EE+Nz5aHgm141MAuiQ41G+qdDndLFRbG
	ANrGTlpxHgMJqVsllU5t69xS+gBReU3/br35xwR9gc3EhtBkB3bs9p2mM5eKTw==
X-Google-Smtp-Source: AGHT+IFXn0MsvuBZAXCBvS9dkUDMWpYZYCtB32osg432CHr09P1w9jeHvq+JeL7M7GqosemFCv0Elw==
X-Received: by 2002:a05:620a:628e:b0:783:daec:2fb8 with SMTP id ov14-20020a05620a628e00b00783daec2fb8mr553057qkn.13.1706310972372;
        Fri, 26 Jan 2024 15:16:12 -0800 (PST)
Received: from denia.c.googlers.com (240.157.150.34.bc.googleusercontent.com. [34.150.157.240])
        by smtp.gmail.com with ESMTPSA id m4-20020a05620a290400b00783de3ddf5esm507358qkp.70.2024.01.26.15.16.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jan 2024 15:16:12 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Fri, 26 Jan 2024 23:16:06 +0000
Subject: [PATCH 07/17] media: i2c: adv748: Fix kerneldoc
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240126-gix-mtk-warnings-v1-7-eed7865fce18@chromium.org>
References: <20240126-gix-mtk-warnings-v1-0-eed7865fce18@chromium.org>
In-Reply-To: <20240126-gix-mtk-warnings-v1-0-eed7865fce18@chromium.org>
To: Tiffany Lin <tiffany.lin@mediatek.com>, 
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>, 
 Yunfei Dong <yunfei.dong@mediatek.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, Hans Verkuil <hverkuil@xs4all.nl>, 
 Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 Bin Liu <bin.liu@mediatek.com>, 
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>, 
 Vikash Garodia <quic_vgarodia@quicinc.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, Bingbu Cao <bingbu.cao@intel.com>, 
 Tianshu Qiu <tian.shu.qiu@intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
 linux-samsung-soc@vger.kernel.org, linux-staging@lists.linux.dev, 
 linux-amlogic@lists.infradead.org, Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.12.3

The field is gone, remove the documentation.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/i2c/adv748x/adv748x.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/media/i2c/adv748x/adv748x.h b/drivers/media/i2c/adv748x/adv748x.h
index 6f90f78f58cf..d2b5e722e997 100644
--- a/drivers/media/i2c/adv748x/adv748x.h
+++ b/drivers/media/i2c/adv748x/adv748x.h
@@ -173,7 +173,6 @@ struct adv748x_afe {
  *
  * @endpoints:		parsed device node endpoints for each port
  *
- * @i2c_addresses:	I2C Page addresses
  * @i2c_clients:	I2C clients for the page accesses
  * @regmap:		regmap configuration pages.
  *

-- 
2.43.0.429.g432eaa2c6b-goog


