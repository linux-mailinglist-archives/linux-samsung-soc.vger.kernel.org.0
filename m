Return-Path: <linux-samsung-soc+bounces-2475-lists+linux-samsung-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 59FB2892D18
	for <lists+linux-samsung-soc@lfdr.de>; Sat, 30 Mar 2024 21:34:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 812FF1F21ADB
	for <lists+linux-samsung-soc@lfdr.de>; Sat, 30 Mar 2024 20:34:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17BC455792;
	Sat, 30 Mar 2024 20:33:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lH+ii08Y"
X-Original-To: linux-samsung-soc@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35F8E5466B
	for <linux-samsung-soc@vger.kernel.org>; Sat, 30 Mar 2024 20:33:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711830811; cv=none; b=QJOpcV2eKnLTYbDXycK4kOv3/u4xcmUUHyE4gtzuGYU8qIBSNvJAoUVTo0xaJq7GR+AZ3vZgRp4gjhy3zCAXfV3znKTZFYB6kArui0ljNVcVHFh360b7MoX9gh+qqxurP+QU88WrvVwQ5MfSxCn8cF0V8RZVmDhrD56wWSF2v3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711830811; c=relaxed/simple;
	bh=+rmPcG4JV6iyQUX2Hn4oOFRCElJhv8FINWMmM2WbyO4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fyXvvu2Q+VvOYKTYQhaZ58FLtQKZkEJNg0Wj6+JKLjPi46UOuNQJg+eThH2qR6d+0a/p/UyTskArLtwoYchd+tjR3UnMuZNuwpAaoPqNpykDTRlJAinQXQbkfZ4Ox+VWTaQn59u05UpP5HRAXlGBnNfD24atH02h04mIA8kYbg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lH+ii08Y; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-33ed4d8e9edso2311701f8f.2
        for <linux-samsung-soc@vger.kernel.org>; Sat, 30 Mar 2024 13:33:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711830808; x=1712435608; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PJTxAUN0vGoMH7nJgQ+DaMYINAW5H4gp4U0ZtpRjHrE=;
        b=lH+ii08YuMqJ9EBNCF+8i+qhKbyZM5nx2G9dfr/gNDEEIMr6na5aRSaGNx5RVqPCPd
         3WaPwH/z3aRMhSR0SFP8JQo128KZ9JlV1y5OUph7wvkenIDHbxUConO6fcYGrYfYvGqE
         2F+lqAbvIjCRvoIFyVNs78H+slY5nbztL0gK4zhS9aSe6uwimryKSmdDuXcsVEpgaaZ3
         mQECMiMBs7t/S6FSGlzPhVQACe/dTSpVXfZwDlAC9EVFjfJSMYjC8Oe4qfCmmVkWB7af
         G/FZV0cQ78jNfsMYW8aHKM4+DSfouLWn0UffRAyOvrN9Ik0Y16zC1FI8cIVG/Chx5UVJ
         BQJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711830808; x=1712435608;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PJTxAUN0vGoMH7nJgQ+DaMYINAW5H4gp4U0ZtpRjHrE=;
        b=H7qnNvcm1ewh1FpVpz4PcVerfdAFvc2ivjObbKN483dTFYyTF5ryJ4+H3JCx8steKG
         31oGSJH7WScmwGWy2yTbfCpyZ+CsGaA10YLBecEMlzJ749lK5glRu3aWedb/1rVtHXYq
         QInnstwyLu+AN1Jz4D5xCAGKfNMAPck/alOcVhVHwG50IWfxz13dTWMvW2SsUoAeEmMp
         uc8ekulCJhmRrJHvJ+YxMn0NYZfHXTwswk50IBRQaqZx1tgY6ndf2hpKwd4ANVVeGX/O
         OtS+e7pLUWC3BFxemqSZiuer5RmOn+YdKxnVn6CfdvfGTLTGHoozMVnYxE+IgFhvXO8W
         hcHw==
X-Forwarded-Encrypted: i=1; AJvYcCUIbEUtYsFa+sOHYrxHvhsfcTpvcqh1wcNymyoZDcr9obMQWmYHMy6qlRT5EAwvKc5SyjgrexO9EZ8HXacZNMFB/f+xv/ODZofcNgTtPbKJn04=
X-Gm-Message-State: AOJu0YxUBcZOlgKZjnJ6SjZKWYGlWdkc1O97g2UEOziwQocTrYxRFy0p
	Z9+aJpe7BknDS1O9m7HtOplt1nNx6T1d7JAul6drIVo0pf5mvOWO+P7+dI7WHHM=
X-Google-Smtp-Source: AGHT+IFxQQijUVcegod93FCFGv8cw1dxNYvym0KjEdok7UHQxBy8zsgoRntIK5eYFhLZG57RYUCMkw==
X-Received: by 2002:adf:f541:0:b0:33e:c522:e3b9 with SMTP id j1-20020adff541000000b0033ec522e3b9mr3296057wrp.36.1711830808608;
        Sat, 30 Mar 2024 13:33:28 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.223.16])
        by smtp.gmail.com with ESMTPSA id f14-20020adfc98e000000b0033b48190e5esm7209315wrh.67.2024.03.30.13.33.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Mar 2024 13:33:28 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Sat, 30 Mar 2024 21:33:10 +0100
Subject: [PATCH 06/11] drm/exynos: mic: drop driver owner initialization
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240330-b4-module-owner-drm-exynos-v1-6-3fa30e2c7e5a@linaro.org>
References: <20240330-b4-module-owner-drm-exynos-v1-0-3fa30e2c7e5a@linaro.org>
In-Reply-To: <20240330-b4-module-owner-drm-exynos-v1-0-3fa30e2c7e5a@linaro.org>
To: Inki Dae <inki.dae@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, 
 Kyungmin Park <kyungmin.park@samsung.com>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=814;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=+rmPcG4JV6iyQUX2Hn4oOFRCElJhv8FINWMmM2WbyO4=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmCHcJ5k0+d3ca3TO3/w0FDMkZE8O8xf+Hu4Szh
 ewMK1QPAyGJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZgh3CQAKCRDBN2bmhouD
 13C6EACKeeh6w1JkMKnow+vqi34knY2zmKJruFipBrXww0Xx68+bYUI19y//5JMwB/pykR+wZdy
 0cP0Xm/L3D15URlDZrhRcdBxEq1hZtjwkS8oLb+zQ6+cjFfX4ZXmItuIS+8j/ywvydgCNHHShbA
 zyLN45u7uzgmJijin3AnKCediRfatmVvBtKdAaUs8eVPOGtnGcu5a4J0WtxGI8LoC0fv+5UIlYQ
 OR66+6t9O7wWzN4JDh/0J7G2tTpj0FfUKnVSxQmTR8wgIFC8aSlDCpLQKkC+Fm+1w5WY/8U5Z2m
 GJgLc4Jn1D/IS0dEHgRoE26rE+0X8zIj+F+GcYMvIB4WhveDwpKLkkhHOs+6RqKdbKqIjskkQYh
 yIhE8UJfB+/4zCSM8dDrILC4c2BOjxgc28L6ZdQ/LRuf3AS8OmUwOF3FdGFYLQ3Yx/PD0pgzvGn
 CMQSrTMDSsizNXLYbFDBBtldk55PtsgUxbZMvobimazAnE5sGwSreFaen+iPWVN5iOj72ncCNUT
 +CPsV3XuyJ/PWiGdRoipCtOFdWmuTbhJD5dhc7NWNQGaWRZYsi4SqSXN6r2YXqBjVTKtaViSd4c
 V9i3DEtMWeBa1pQ+K1aqiKV4VtUmI2A56UFa6rryHIlWdwFj6FUlkg2eHBjk/HMHpeoPMVSVJ4G
 +RdSlAYzRRcsyPg==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Core in platform_driver_register() already sets the .owner, so driver
does not need to.  Whatever is set here will be anyway overwritten by
main driver calling platform_driver_register().

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/gpu/drm/exynos/exynos_drm_mic.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_mic.c b/drivers/gpu/drm/exynos/exynos_drm_mic.c
index e2920960180f..d61ec451807c 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_mic.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_mic.c
@@ -464,7 +464,6 @@ struct platform_driver mic_driver = {
 	.driver		= {
 		.name	= "exynos-mic",
 		.pm	= pm_ptr(&exynos_mic_pm_ops),
-		.owner	= THIS_MODULE,
 		.of_match_table = exynos_mic_of_match,
 	},
 };

-- 
2.34.1


