Return-Path: <linux-samsung-soc+bounces-438-lists+linux-samsung-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DF207807B35
	for <lists+linux-samsung-soc@lfdr.de>; Wed,  6 Dec 2023 23:16:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9A70A282144
	for <lists+linux-samsung-soc@lfdr.de>; Wed,  6 Dec 2023 22:16:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 988F1563A6;
	Wed,  6 Dec 2023 22:16:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=crapouillou.net header.i=@crapouillou.net header.b="GjHJSw4Q"
X-Original-To: linux-samsung-soc@vger.kernel.org
Received: from aposti.net (aposti.net [89.234.176.197])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7BEC3DE;
	Wed,  6 Dec 2023 14:16:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
	s=mail; t=1701900964;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=A+HKMjX23gsN6vSBJGJR0lhigHyqUNulJJzH3y7+qeI=;
	b=GjHJSw4QqikTVX9VTsSIr0ynJMtQL1dCaUU4q9y3KL/SsCq5kMlMGHjprah7eWdT3Gyriv
	YwOCShGwxcq41njwcHhLLfIIOlV8UU3b4l6aYeesZGW5j/WWmuZPHW88H0p4dKBOg30gzR
	uU8PhcA/nietXDFz8cVQsCjj3bTL1t0=
From: Paul Cercueil <paul@crapouillou.net>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH 0/3] ARM: dts: samsung: exynos4210-i9100 updates
Date: Wed,  6 Dec 2023 23:15:53 +0100
Message-ID: <20231206221556.15348-1-paul@crapouillou.net>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam: Yes

Hi Krzysztof / Rob,

Here a small patchset with a fix and some improvements to the DTS for
the Galaxy S2 (aka. i9100) phone.

The first patch unconditionally enables a regulator, which seems to be
needed for the phone to boot properly. I do not know what it is
connected to.

The last two patches add nodes for the touch keys and the accelerometer.

This patchset is based on linux-next-20231206.

Cheers,
-Paul.

Paul Cercueil (3):
  ARM: dts: samsung: exynos4210-i9100: Unconditionally enable LDO12
  ARM: dts: samsung: exynos4210-i9100: Add node for touch keys
  ARM: dts: samsung: exynos4210-i9100: Add accelerometer node

 .../arm/boot/dts/samsung/exynos4210-i9100.dts | 48 ++++++++++++++++++-
 1 file changed, 47 insertions(+), 1 deletion(-)

-- 
2.42.0


