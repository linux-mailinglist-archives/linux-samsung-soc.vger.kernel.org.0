Return-Path: <linux-samsung-soc+bounces-822-lists+linux-samsung-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C50B81DB48
	for <lists+linux-samsung-soc@lfdr.de>; Sun, 24 Dec 2023 16:48:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BEA3D1F219B1
	for <lists+linux-samsung-soc@lfdr.de>; Sun, 24 Dec 2023 15:48:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B8B019454;
	Sun, 24 Dec 2023 15:44:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="eXUHames"
X-Original-To: linux-samsung-soc@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B86D18EA7
	for <linux-samsung-soc@vger.kernel.org>; Sun, 24 Dec 2023 15:44:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-40c48d7a7a7so30354775e9.3
        for <linux-samsung-soc@vger.kernel.org>; Sun, 24 Dec 2023 07:44:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1703432688; x=1704037488; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NDWXSVz2KCM79MpUKy9CV++h5zIlk2lSIe/fyWdkp3E=;
        b=eXUHamesL1A/d5w794XdZzORxWbmHKraSE6CmDNq/ofpwMLMT74NkXNA/2AJxkCzxT
         zZuZxTNMk9Cmmhu2SsfNSjiyp55LIFQdSmp/hqajhaV2i3eEac1n0cEdM3Og+8drgMBi
         +5loAGNtexCshlV01dinvydcIZKhlHDuAf+aWF+lPJDKADztYHwBlj03RXC/hj9Gm1h7
         QwUDWfjLO9JcolIp/OmM6gQmFEMLOsV3MAszErk89BFvo1KNt0156HDewtxK1LqIonsz
         nqHz+PrOixhBK2pOjBZHcGHg7VUQBB9riHQBc2SGq02M9mLvuJ8Kp6AWBYogib7sTtDH
         5ScA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703432688; x=1704037488;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NDWXSVz2KCM79MpUKy9CV++h5zIlk2lSIe/fyWdkp3E=;
        b=J+Ks/+x0OwL9B55voeJ/81+9vi424445ClOjohSNkh4Fwmom5jphv9FJ3qpvJbqvN5
         gBvbaoi5Bdhy+kWfOBMNGvgSjz+4wDiA4WFvb9hsdx3fRHLCdByH0WGdYZO8WPZC8K4Y
         ktzdIKIdQN965VU+6PfpoaL4iZER0Z9S1t1kVKMdTYo+xBtGWgM/EUwmGM2GgYZUY9KA
         cEbkW8Lhll6KVqcqTDWffFfkJcDldzP4LZ0a89zEonHDS5+gfQz4W4tb4F9xWabg2vnX
         3/iNDPyWGWZDYJuW1MNq/GcihZA699/SwVIHX2XZ1cX8nUVFS9kyilIfNU6WEQjTizu/
         1ORw==
X-Gm-Message-State: AOJu0YzbmawIpPFjHwitjrmhmb+klU6D7Tfmh3rCO7nHbMen1zLhmbJk
	N2vqJ0QbVXtfIe+XUH1ggQ8T4twhZMLmSbAg74R0mj3SEDk=
X-Google-Smtp-Source: AGHT+IHe2nVWvkUtwXhZsmXI3rB+Z5hHEylqrUulG2W34bGPt954jQWKdciG6OGyzuyoq8uzX5d4Cw==
X-Received: by 2002:a05:600c:6010:b0:40d:4a22:2628 with SMTP id az16-20020a05600c601000b0040d4a222628mr2192791wmb.41.1703432687952;
        Sun, 24 Dec 2023 07:44:47 -0800 (PST)
Received: from [127.0.1.1] ([78.10.206.178])
        by smtp.gmail.com with ESMTPSA id ge12-20020a170907908c00b00a26ac403032sm3325901ejb.65.2023.12.24.07.44.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Dec 2023 07:44:47 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Sun, 24 Dec 2023 16:44:13 +0100
Subject: [PATCH 14/15] media: s5p-mfc: drop useless static s5p_mfc_dev in
 s5p_mfc_pm.c
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231224-n-s5p-mfc-const-v1-14-a3b246470fe4@linaro.org>
References: <20231224-n-s5p-mfc-const-v1-0-a3b246470fe4@linaro.org>
In-Reply-To: <20231224-n-s5p-mfc-const-v1-0-a3b246470fe4@linaro.org>
To: Marek Szyprowski <m.szyprowski@samsung.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Aakarsh Jain <aakarsh.jain@samsung.com>, linux-fsd@tesla.coma, 
 linux-samsung-soc@vger.kernel.org, 
 Smitha T Murthy <smithatmurthy@gmail.com>, 
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=900;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=Fa0Mi6emzcHWlV3HqGPkNIGFTFGr3syiwm86et4G/MQ=;
 b=owEBfgKB/ZANAwAKAcE3ZuaGi4PXAcsmYgBliFHakB4/85S8Dq/xnyUAP9r3ll9Vk3PEZrgw3
 YLe2PK+BaSJAkQEAAEKAC4WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZYhR2hAca3J6a0BrZXJu
 ZWwub3JnAAoJEME3ZuaGi4PX5cMP/2n4Kw5KHfACgSOfmcfQArYZIb+skcaVjpV8F7FNt9M7ME4
 Y8yjpVUVDiWhhq91AfEMMkHVuotmu7QmSvd/O/vqyT/ViG1i5CkKKaNUEEsodVzeyJsnuKliwbM
 KOZV6ENgQhUMON6zfBQzzpnIWH15dfw7Ji3amRhzKokepHfd4AZQVzNwp6hZ0XM+pVCcfQWyr96
 2hrEP7utbe0DKa69xmVM1AgRK8n6npoDn6zT5YSPYCwLaqJGDa1xJRd9ZNJ8rDcm7dK468s87ZB
 t2c29BxhfPLlp3CbEJK+HGZ77fxpMMzbRYoNH429EcbkYr0xEf4YnCynXljt6/6+N5FooRiwThA
 ZN2WGMs/ZCCGs5FiTGDUPwmN3tXmnhM4uxiRK5YLl88QlRXfgh1kABh1HDRjUxr0t0buSl06ru+
 LHfhj3eUygC2p9fFeKrrkxblD7x3VxFamc6M0ycluZGDSlOqwjgjQlGt/7EEE8qgSkgfNNgFKwX
 2bCCvkq/+cG0ecWzegql68O52CRZK6lMcB0e4BFNSr2n0rutChRK/k3+leK1IGUJhRPWVW3G1nj
 090RINJD1iprvTJoDbcMsBoxyJFAdnj95c889/klSMpx91lR+2+Y9yPqp3OXCDsLRF9ZD2IwuVo
 R3dgcW7CoxXVJYJ9jQb8r7Wh0W/dpJe+4x4c8
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Pointer "struct s5p_mfc_dev" is stored in s5p_mfc_pm.c once and never
used again.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/media/platform/samsung/s5p-mfc/s5p_mfc_pm.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/media/platform/samsung/s5p-mfc/s5p_mfc_pm.c b/drivers/media/platform/samsung/s5p-mfc/s5p_mfc_pm.c
index 29b141d4a7a7..ecb3065c33c9 100644
--- a/drivers/media/platform/samsung/s5p-mfc/s5p_mfc_pm.c
+++ b/drivers/media/platform/samsung/s5p-mfc/s5p_mfc_pm.c
@@ -15,15 +15,12 @@
 #include "s5p_mfc_pm.h"
 
 static struct s5p_mfc_pm *pm;
-static struct s5p_mfc_dev *p_dev;
 
 int s5p_mfc_init_pm(struct s5p_mfc_dev *dev)
 {
 	int i;
 
 	pm = &dev->pm;
-	p_dev = dev;
-
 	pm->num_clocks = dev->variant->num_clocks;
 	pm->clk_names = dev->variant->clk_names;
 	pm->device = &dev->plat_dev->dev;

-- 
2.34.1


