Return-Path: <linux-samsung-soc+bounces-2145-lists+linux-samsung-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CA76B86C906
	for <lists+linux-samsung-soc@lfdr.de>; Thu, 29 Feb 2024 13:20:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4EF8128B1ED
	for <lists+linux-samsung-soc@lfdr.de>; Thu, 29 Feb 2024 12:20:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 884E87D077;
	Thu, 29 Feb 2024 12:20:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OO9bLWQ6"
X-Original-To: linux-samsung-soc@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C6C77D063
	for <linux-samsung-soc@vger.kernel.org>; Thu, 29 Feb 2024 12:20:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709209229; cv=none; b=Ey/pn0FYtTPYT18X6yGfL8wRL8XAeKGGTWphgsTOkrfpf31osvbwGgaJCZccTKFHE8cKNWhXy6Bb6lvlxwYw3wMvONKYveh+aRPzxUnNglu/R/x0rBG3C+IFWX1O/MgU5IS+ruSkW2eJnzPjbSfJYK504P06p2F6rfgl4nkFgUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709209229; c=relaxed/simple;
	bh=LWsIkAYDWf7LqGpD23VVrUWalygC0mmJCNlJ0GD9kxo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EEM/l7fUHDjmyIACGBEwZJ/z2NjL/P+8+nDeEQ04wSWZWoPCqdSpQPiSu+X60qdkWcjGHeNRMvrzPc9s8PhOC6wVjYrsUhA1+seUVYOGm2QWD8VOamup2RM6KZybr36uUuubaljnMbG/QUjMBcM0WFrVR/3sDVwD7xjiSwwTVxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OO9bLWQ6; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-412b99eb5cfso5652995e9.3
        for <linux-samsung-soc@vger.kernel.org>; Thu, 29 Feb 2024 04:20:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709209226; x=1709814026; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W4M9b5DpBPobgh8Mhjoui4tnMINgMrMyk8rX4fi/AOw=;
        b=OO9bLWQ6ZFKVFtbEr6BldoYEJMTASYFVC+/LAjj21y5ohQfaQHr0U9SF80vbZ9W3Bj
         IMa/fsIAffiDaswrsBIyXKVI9n5GsZSyUjp+XsAYyxmpyfI/HmEmXQ54OaFOfzDBk0b2
         T94m3AxKfrL7soJOf2/oDCVXep8L/cl9QdMTBQ3UIK/ebK9MPQch22lU8MSnmiFCA8vs
         KdBNj4WCyU4pKIOEnCzXz4x7BDnAJKURWzIwnoh1W76dlyOp8dIelAwhBlyAKUTurnRP
         /p1dzmKjUyOk1k9ZAZA3d5dAlwq2YKN6ke8In6LR/Rfy0wU6v0yIrJ21KDEvR1VQMM28
         Uomw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709209226; x=1709814026;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W4M9b5DpBPobgh8Mhjoui4tnMINgMrMyk8rX4fi/AOw=;
        b=UIRlQ0fipYPwoZhhAPoRf2AzBAVFEgv6uLkBMvdz83VtkXCrMVTvbfstslydKjzb4V
         XAXK5HJW3/D6DewEFv06d264YPyXBAy0ujocUZDIsPw96vacwFS3ZPn80p0SVPo4Tm9m
         P/W03rxelKuNH3JXP9YLZQF8qO+RIMkHXjHi3ydnIQ2dZjJQruf1s7UsIyx/eSFIt5a7
         /hNd/1+tEkqRqu2Oyoc1XiYGPHh6Udr5bXnjz8lMnFWnp+vdfp66Vl+70sVVTe2q2o6t
         jfhCfVI2en1PRbKfIpdpqTfRva45fC5C8pZ9h+a4zdfaFqal6nPajHjA0Nm11Mh5Bplp
         vONw==
X-Forwarded-Encrypted: i=1; AJvYcCWs0phmAE6vXADLBpTQvkMyNNywtOkqWL5seODI4BK92orzedDZb9k+X0ZDXkoV4UCLNFulntKTVLghe+OzMz1UFSZgPvb61V/sxji2Mzu6q3c=
X-Gm-Message-State: AOJu0YwYIHQa+dY4I1RIVRvYRdFZrHUcFTb43pnxpQz+Jnvjw5a5Zacg
	GWu61XJfIWhXQDi/g7iJujmEo1LrPYhBAIkOoYivGyruAC3aHcJXtv78YjG/In4=
X-Google-Smtp-Source: AGHT+IGAJkhlBfG2CKT06QC7y4mjYnfFUhJwTLNBtPVcIKi9pc7xcY/jG0JFUbXbt+Xke0czdy+XHA==
X-Received: by 2002:a05:600c:4e41:b0:412:b53f:99e4 with SMTP id e1-20020a05600c4e4100b00412b53f99e4mr1373760wmq.40.1709209225925;
        Thu, 29 Feb 2024 04:20:25 -0800 (PST)
Received: from ta2.c.googlers.com.com (110.121.148.146.bc.googleusercontent.com. [146.148.121.110])
        by smtp.gmail.com with ESMTPSA id dx14-20020a05600c63ce00b004129f28e2cdsm5009121wmb.3.2024.02.29.04.20.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Feb 2024 04:20:24 -0800 (PST)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
To: krzysztof.kozlowski@linaro.org,
	s.nawrocki@samsung.com,
	cw00.choi@samsung.com,
	semen.protsenko@linaro.org
Cc: alim.akhtar@samsung.com,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	peter.griffin@linaro.org,
	andre.draszik@linaro.org,
	linux-samsung-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	willmcvicker@google.com,
	kernel-team@android.com,
	Tudor Ambarus <tudor.ambarus@linaro.org>
Subject: [PATCH 1/4] clk: samsung: introduce nMUX for MUX clks that can reparented
Date: Thu, 29 Feb 2024 12:20:18 +0000
Message-ID: <20240229122021.1901785-2-tudor.ambarus@linaro.org>
X-Mailer: git-send-email 2.44.0.278.ge034bb2e1d-goog
In-Reply-To: <20240229122021.1901785-1-tudor.ambarus@linaro.org>
References: <20240229122021.1901785-1-tudor.ambarus@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

All samsung MUX clocks that are defined with MUX() set the
CLK_SET_RATE_NO_REPARENT flag in __MUX(), which prevents muxes to be
reparented during clk_set_rate.

Introduce nMUX() for MUX clocks that can be reparented. GS101 SoC will use
nMUX as there are MUX clocks which are dedicated per IP, thus
reparenting the MUX will not affect other IPs. Exynos850 can use it too.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 drivers/clk/samsung/clk.h | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/clk/samsung/clk.h b/drivers/clk/samsung/clk.h
index a763309e6f12..75e2fa8d7da9 100644
--- a/drivers/clk/samsung/clk.h
+++ b/drivers/clk/samsung/clk.h
@@ -146,6 +146,26 @@ struct samsung_mux_clock {
 #define MUX_F(_id, cname, pnames, o, s, w, f, mf)		\
 	__MUX(_id, cname, pnames, o, s, w, f, mf)
 
+/* Used by MUX clocks where reparenting is allowed. */
+#define __nMUX(_id, cname, pnames, o, s, w, f, mf)		\
+	{							\
+		.id		= _id,				\
+		.name		= cname,			\
+		.parent_names	= pnames,			\
+		.num_parents	= ARRAY_SIZE(pnames),		\
+		.flags		= f,				\
+		.offset		= o,				\
+		.shift		= s,				\
+		.width		= w,				\
+		.mux_flags	= mf,				\
+	}
+
+#define nMUX(_id, cname, pnames, o, s, w)			\
+	__nMUX(_id, cname, pnames, o, s, w, 0, 0)
+
+#define nMUX_F(_id, cname, pnames, o, s, w, f, mf)		\
+	__nMUX(_id, cname, pnames, o, s, w, f, mf)
+
 /**
  * struct samsung_div_clock - information about div clock
  * @id: platform specific id of the clock
-- 
2.44.0.278.ge034bb2e1d-goog


