Return-Path: <linux-samsung-soc+bounces-1365-lists+linux-samsung-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 11DDB83DFA2
	for <lists+linux-samsung-soc@lfdr.de>; Fri, 26 Jan 2024 18:16:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A2F7F1F227F2
	for <lists+linux-samsung-soc@lfdr.de>; Fri, 26 Jan 2024 17:16:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FDD0208A3;
	Fri, 26 Jan 2024 17:15:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="j69YWkrT"
X-Original-To: linux-samsung-soc@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AE00200C8
	for <linux-samsung-soc@vger.kernel.org>; Fri, 26 Jan 2024 17:15:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706289355; cv=none; b=oJa0v3o6KDRmIH394Ko6spBnyQAFGXmAl8p+Oo1WXoqDfZObXK2VtacA0djqAcpFZ2JiHuD7uB5qJ3uaPEGMKILWs/FJEUo4MCdso47VOR3mboSH2tQyYkwr9GoA7wYdoVWwrQFydK5ZxQVpu7oMoe1QCD01AZInAt2WIYFyyY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706289355; c=relaxed/simple;
	bh=/bUj8RLEZjYthKdQPh+B31SkdTcIYenu7ITI+3MnkQQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rX+6hvaI11wQNsNmqVXj8B7PmXghUKXBSab3tIphxs/ipWfPAHPuHeHUnBu0g2YvjXKzZpomIH0VQ5HaF5dy0vfOd5XavXWY1vxv7cDIonr+zEhcc/SShBatyf0Lbbo+jgioAZIk1hOFD6WyNLEJhEHjsH66Da8yOIjv4D9iL2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=j69YWkrT; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-40ed1e78835so10008175e9.2
        for <linux-samsung-soc@vger.kernel.org>; Fri, 26 Jan 2024 09:15:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706289352; x=1706894152; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qV8ITwl1O57QlGGOA7a30fekUIiUXq0J9XlHzcfvV8M=;
        b=j69YWkrTdXJh3Sc3GxAPdndbbSVV3eHyHsLn7hnXdDGFmAHH4bttsILKKx72ht9qUv
         QN0ktjRpWHjoT9STE+Nsgq5DsIKaMtI4sZ728lO9GmwCbkPX1bZG/n0/WD7dPOEwulC0
         ig8RHeGa88NbXzIv6ai11WDZKPu3v/R7pmZkETPiY5qTA6nhtTgbE1w9CbF7NCRansUU
         nvM1+XlpiuHMBZ9oW1pF66jMU0bhaDAG+hY+HWtls7ODggFg++v5Asz/NdjBxyiQzg+e
         3YV+4/CCSVk4SIkmU3+ROp2iFyO4L7XjPUPYaRmFWYn0MQeAFEzAxNkwAs6iTfvSRWix
         OZuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706289352; x=1706894152;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qV8ITwl1O57QlGGOA7a30fekUIiUXq0J9XlHzcfvV8M=;
        b=pSppzd/z1CGUQBX+7tS1IAKXASSUq+BX+/wB8tJq1k+f4ILkbn2vSD+wfw6H22nfY7
         QNmGqRQg0Hq0K9/Kr9zO+QGHwL40sJuduZEJmUYJ718oyEtLuoVztie6GJ6VeIOxKYqv
         ipefNebPh7sW6GmRryL9VOziXxJP7l/2u0rwwYcWAWz+wehZWnchnLM9ULQ/WbRLbuGm
         7Wl2bn5oQghsbWz+VNxLlLUSfBHSikm08QSt9jzGsKJtRgCIYSLubCgRQHv5geFQPEIw
         mXHIuD9NeJW1ZLuaIwe5xSCS2J3BigjDQNYBR4niULUPDcUMNF7MoQT5k6CKCDlXB4Uh
         aIVg==
X-Gm-Message-State: AOJu0Ywqh9i/JWrCH6Jz/qlOR43y2QZPj0X1fSIF0oTUbRNugb0GpHjT
	I8E7vZH6CtCSFVK0xVrQD/mceW+wTM/TmR9W4CRv8lbh5LlzUaZKInM2cq9PIa0=
X-Google-Smtp-Source: AGHT+IEvNW5DbdU8iWYCHzL7THeKzP8fEDzX/ESRePAImO9XzqkTKIuqDrCsNewY4d6xeB03PZgS4Q==
X-Received: by 2002:a05:600c:378b:b0:40e:8bb2:6bcf with SMTP id o11-20020a05600c378b00b0040e8bb26bcfmr75031wmr.151.1706289351730;
        Fri, 26 Jan 2024 09:15:51 -0800 (PST)
Received: from ta2.c.googlers.com.com (88.140.78.34.bc.googleusercontent.com. [34.78.140.88])
        by smtp.gmail.com with ESMTPSA id k10-20020a05600c1c8a00b0040e451fd602sm6287286wms.33.2024.01.26.09.15.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jan 2024 09:15:50 -0800 (PST)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
To: broonie@kernel.org,
	andi.shyti@kernel.org,
	semen.protsenko@linaro.org
Cc: krzysztof.kozlowski@linaro.org,
	alim.akhtar@samsung.com,
	jassi.brar@samsung.com,
	linux-spi@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	andre.draszik@linaro.org,
	peter.griffin@linaro.org,
	kernel-team@android.com,
	willmcvicker@google.com,
	Tudor Ambarus <tudor.ambarus@linaro.org>
Subject: [PATCH v3 03/17] spi: s3c64xx: avoid possible negative array index
Date: Fri, 26 Jan 2024 17:15:31 +0000
Message-ID: <20240126171546.1233172-4-tudor.ambarus@linaro.org>
X-Mailer: git-send-email 2.43.0.429.g432eaa2c6b-goog
In-Reply-To: <20240126171546.1233172-1-tudor.ambarus@linaro.org>
References: <20240126171546.1233172-1-tudor.ambarus@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The platform id is used as an index into the fifo_lvl_mask array.
Platforms can come with a negative device ID, PLATFORM_DEVID_NONE (-1),
thus we risked a negative array index. Catch such cases and fail to
probe.

Fixes: 2b90807549e5 ("spi: s3c64xx: add device tree support")
Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>
Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 drivers/spi/spi-s3c64xx.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/spi/spi-s3c64xx.c b/drivers/spi/spi-s3c64xx.c
index 2b5bb7604526..c3176a510643 100644
--- a/drivers/spi/spi-s3c64xx.c
+++ b/drivers/spi/spi-s3c64xx.c
@@ -1189,6 +1189,9 @@ static int s3c64xx_spi_probe(struct platform_device *pdev)
 					     "Failed to get alias id\n");
 		sdd->port_id = ret;
 	} else {
+		if (pdev->id < 0)
+			return dev_err_probe(&pdev->dev, -EINVAL,
+					     "Negative platform ID is not allowed\n");
 		sdd->port_id = pdev->id;
 	}
 
-- 
2.43.0.429.g432eaa2c6b-goog


