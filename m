Return-Path: <linux-samsung-soc+bounces-815-lists+linux-samsung-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5362081DB33
	for <lists+linux-samsung-soc@lfdr.de>; Sun, 24 Dec 2023 16:46:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7617C1C20C1C
	for <lists+linux-samsung-soc@lfdr.de>; Sun, 24 Dec 2023 15:46:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CAFC9101C5;
	Sun, 24 Dec 2023 15:44:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BBADRzrX"
X-Original-To: linux-samsung-soc@vger.kernel.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29D7C107BF
	for <linux-samsung-soc@vger.kernel.org>; Sun, 24 Dec 2023 15:44:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-a26ea1e88b7so40398366b.1
        for <linux-samsung-soc@vger.kernel.org>; Sun, 24 Dec 2023 07:44:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1703432678; x=1704037478; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=axh4aYmZJTMFAWOcFz7z6cVx1m8iVzvw4JafOlokaF4=;
        b=BBADRzrXxGQZKSTbbBtxbIO9h1IWCuYJgkqoOUzCX/yV9gxOKo/sejn/7KWR+yHIvg
         /ji5fZGYHMtxH4M8yeM06M9PWi6QJaHYWdpgSxce6KMlywAXaHZSTz5tXNWX69ygSaWH
         SNcOzjQRCu8UudUj3imppSjptXwbgrCRQhSCKjrjGB6tADceUaNVmXD+hw3H/ldEjm1q
         cWmW6edT2PIvZHWWo442Oq5chXq+rqmbz33X9RrzXuT0a4BRgzwgOwsGPwJ93sjgzydl
         mO9Ghr+DGXFBIzVIkgFeuIKzZRMxPrx/WVvTlGlwd/UhvqE8VoisUo2g1Yucs47YHJZY
         cDOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703432678; x=1704037478;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=axh4aYmZJTMFAWOcFz7z6cVx1m8iVzvw4JafOlokaF4=;
        b=Av4ApchGHFuV66A4xV8niS5PakmuI9bOKKSCDAOE/AoiZkVmtw3VWTItHU9xMGq9vQ
         dFszaP1Xsd/SoYMoL4bwhOD9VUD/dvqn7zC2tG7MvCrhACjB921mbuH6o3q5WEdw7+Ze
         M+Sj4sw+Q584MQxFHwG4uQPDRzHojnMhJDM1VdhxOl/13yDpE8ILTHQAZNM1jGLtPRXx
         JMrX3hQVNuOeAx1eTWpIS2F+98XVgk5f8buSVCBODCr9UjXN88+NSpFTfFG/qsH55JoB
         9znNDDXTZUichtlatnOaY5tOxCmoeFXBwmjF3VrPQ2iZdU58vXaXFdOUmD0FBv8q4RDI
         utQw==
X-Gm-Message-State: AOJu0YxohSTK+T+4LtS+UPzEo+6a3M01Rj+2LA44i59YTqgyzf74guOi
	um2Cqt1HhM+OgOjac25Pm5nIkOLt5RIi5w==
X-Google-Smtp-Source: AGHT+IFTxUD5XmeSWMzCl542MzJrIKxzQRJWTyDjixOd+YwahjXJkiVCK4SBBeDOB5vSilZbmPTNcA==
X-Received: by 2002:a17:906:1088:b0:a1f:a03d:2fdb with SMTP id u8-20020a170906108800b00a1fa03d2fdbmr1929515eju.14.1703432678399;
        Sun, 24 Dec 2023 07:44:38 -0800 (PST)
Received: from [127.0.1.1] ([78.10.206.178])
        by smtp.gmail.com with ESMTPSA id ge12-20020a170907908c00b00a26ac403032sm3325901ejb.65.2023.12.24.07.44.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Dec 2023 07:44:37 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Sun, 24 Dec 2023 16:44:06 +0100
Subject: [PATCH 07/15] media: s5p-mfc: constify s5p_mfc_hw_cmds structures
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231224-n-s5p-mfc-const-v1-7-a3b246470fe4@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4103;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=vm3UP9CqmFjf//LP0scO2VoaX48o+Ww6ScCgclJ4Q5A=;
 b=owEBfgKB/ZANAwAKAcE3ZuaGi4PXAcsmYgBliFHUT28rkpw42lL25ukkglr2QdvydQzfLFvJQ
 rBoA3r1k7KJAkQEAAEKAC4WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZYhR1BAca3J6a0BrZXJu
 ZWwub3JnAAoJEME3ZuaGi4PX1SEP/0DQic8fj0+AyI5fa8gr8cXAwYtNAugvSO0yKiYjUKz3HyU
 pDjaupHcIlf8mkGhy6ZDLZcddPHiUkofOvnFIGA3lTj3m+u5LQ0NHgd+wRthkeg2lOSRJBZ0kn0
 649/eqNP5xxu0gYD89fFAVDkXwA0F5RiAo57YjDJooYTlkUFzVJI9dLnmPPk4nA2g9N9UN66Tpq
 2NRAVxJnlxKl8eMBSxKaCg16a+nzSg8szMJvK0YBCBV8hxd7cZOq6yu+ryOdFHU9b5PoHsFV0/c
 UyUqMa2Q1JYwX7bsyi+ef+DIAp0ZupteXVyexu78QwrPzXeFtsJDl+/tQj8Hv+DG9TCuj7cwjv2
 aoksIAph3NSVHSucP/usWSaAruPMRJXHjGYPBV6tabJDt1xxF08ZvyDCz2N0HZxsRJR++9wlg36
 I07EOvpaWJ1WSFG3Es9m8DkTIRcSl+gJaLGa4uvpLRBbWtXsbl0YPiLvh4a2Fz4E/Ghunwlzm1E
 lhux6b7Rhd/Jh4eA+vSVy8gtvV3HwV8sACiKli6QlmjfboN66nNYRNkYr6GIqkmukFKMSTbdjkk
 kCeaof37c10+iBbkn1yW91tRvW4wAnRPNmQqCgQ776CLZKwLYienFTd2W3/5Guh3EP3dfa/ihtT
 hKtzWvNell5K1UG0mTXOamSuck6k1qPLpomVX
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Static "s5p_mfc_hw_cmds" structures are not modified by the driver, so
they can be made const for code safety.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/media/platform/samsung/s5p-mfc/s5p_mfc_cmd_v5.c | 4 ++--
 drivers/media/platform/samsung/s5p-mfc/s5p_mfc_cmd_v5.h | 2 +-
 drivers/media/platform/samsung/s5p-mfc/s5p_mfc_cmd_v6.c | 4 ++--
 drivers/media/platform/samsung/s5p-mfc/s5p_mfc_cmd_v6.h | 2 +-
 drivers/media/platform/samsung/s5p-mfc/s5p_mfc_common.h | 2 +-
 5 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/media/platform/samsung/s5p-mfc/s5p_mfc_cmd_v5.c b/drivers/media/platform/samsung/s5p-mfc/s5p_mfc_cmd_v5.c
index 327e54e70611..1fbf7ed5d4cc 100644
--- a/drivers/media/platform/samsung/s5p-mfc/s5p_mfc_cmd_v5.c
+++ b/drivers/media/platform/samsung/s5p-mfc/s5p_mfc_cmd_v5.c
@@ -148,7 +148,7 @@ static int s5p_mfc_close_inst_cmd_v5(struct s5p_mfc_ctx *ctx)
 }
 
 /* Initialize cmd function pointers for MFC v5 */
-static struct s5p_mfc_hw_cmds s5p_mfc_cmds_v5 = {
+static const struct s5p_mfc_hw_cmds s5p_mfc_cmds_v5 = {
 	.cmd_host2risc = s5p_mfc_cmd_host2risc_v5,
 	.sys_init_cmd = s5p_mfc_sys_init_cmd_v5,
 	.sleep_cmd = s5p_mfc_sleep_cmd_v5,
@@ -157,7 +157,7 @@ static struct s5p_mfc_hw_cmds s5p_mfc_cmds_v5 = {
 	.close_inst_cmd = s5p_mfc_close_inst_cmd_v5,
 };
 
-struct s5p_mfc_hw_cmds *s5p_mfc_init_hw_cmds_v5(void)
+const struct s5p_mfc_hw_cmds *s5p_mfc_init_hw_cmds_v5(void)
 {
 	return &s5p_mfc_cmds_v5;
 }
diff --git a/drivers/media/platform/samsung/s5p-mfc/s5p_mfc_cmd_v5.h b/drivers/media/platform/samsung/s5p-mfc/s5p_mfc_cmd_v5.h
index 6eafa514aebc..c626376053c4 100644
--- a/drivers/media/platform/samsung/s5p-mfc/s5p_mfc_cmd_v5.h
+++ b/drivers/media/platform/samsung/s5p-mfc/s5p_mfc_cmd_v5.h
@@ -11,6 +11,6 @@
 
 #include "s5p_mfc_common.h"
 
-struct s5p_mfc_hw_cmds *s5p_mfc_init_hw_cmds_v5(void);
+const struct s5p_mfc_hw_cmds *s5p_mfc_init_hw_cmds_v5(void);
 
 #endif /* S5P_MFC_CMD_H_ */
diff --git a/drivers/media/platform/samsung/s5p-mfc/s5p_mfc_cmd_v6.c b/drivers/media/platform/samsung/s5p-mfc/s5p_mfc_cmd_v6.c
index 25c4719a5dd0..740aa4dfae57 100644
--- a/drivers/media/platform/samsung/s5p-mfc/s5p_mfc_cmd_v6.c
+++ b/drivers/media/platform/samsung/s5p-mfc/s5p_mfc_cmd_v6.c
@@ -154,7 +154,7 @@ static int s5p_mfc_close_inst_cmd_v6(struct s5p_mfc_ctx *ctx)
 }
 
 /* Initialize cmd function pointers for MFC v6 */
-static struct s5p_mfc_hw_cmds s5p_mfc_cmds_v6 = {
+static const struct s5p_mfc_hw_cmds s5p_mfc_cmds_v6 = {
 	.cmd_host2risc = s5p_mfc_cmd_host2risc_v6,
 	.sys_init_cmd = s5p_mfc_sys_init_cmd_v6,
 	.sleep_cmd = s5p_mfc_sleep_cmd_v6,
@@ -163,7 +163,7 @@ static struct s5p_mfc_hw_cmds s5p_mfc_cmds_v6 = {
 	.close_inst_cmd = s5p_mfc_close_inst_cmd_v6,
 };
 
-struct s5p_mfc_hw_cmds *s5p_mfc_init_hw_cmds_v6(void)
+const struct s5p_mfc_hw_cmds *s5p_mfc_init_hw_cmds_v6(void)
 {
 	return &s5p_mfc_cmds_v6;
 }
diff --git a/drivers/media/platform/samsung/s5p-mfc/s5p_mfc_cmd_v6.h b/drivers/media/platform/samsung/s5p-mfc/s5p_mfc_cmd_v6.h
index 9dc44460cc38..29083436f517 100644
--- a/drivers/media/platform/samsung/s5p-mfc/s5p_mfc_cmd_v6.h
+++ b/drivers/media/platform/samsung/s5p-mfc/s5p_mfc_cmd_v6.h
@@ -11,6 +11,6 @@
 
 #include "s5p_mfc_common.h"
 
-struct s5p_mfc_hw_cmds *s5p_mfc_init_hw_cmds_v6(void);
+const struct s5p_mfc_hw_cmds *s5p_mfc_init_hw_cmds_v6(void);
 
 #endif /* S5P_MFC_CMD_H_ */
diff --git a/drivers/media/platform/samsung/s5p-mfc/s5p_mfc_common.h b/drivers/media/platform/samsung/s5p-mfc/s5p_mfc_common.h
index 6a47f3434c60..9278ed537e9c 100644
--- a/drivers/media/platform/samsung/s5p-mfc/s5p_mfc_common.h
+++ b/drivers/media/platform/samsung/s5p-mfc/s5p_mfc_common.h
@@ -339,7 +339,7 @@ struct s5p_mfc_dev {
 	struct s5p_mfc_priv_buf ctx_buf;
 	int warn_start;
 	struct s5p_mfc_hw_ops *mfc_ops;
-	struct s5p_mfc_hw_cmds *mfc_cmds;
+	const struct s5p_mfc_hw_cmds *mfc_cmds;
 	const struct s5p_mfc_regs *mfc_regs;
 	enum s5p_mfc_fw_ver fw_ver;
 	bool fw_get_done;

-- 
2.34.1


