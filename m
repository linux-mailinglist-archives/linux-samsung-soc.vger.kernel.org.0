Return-Path: <linux-samsung-soc+bounces-5743-lists+linux-samsung-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 888949E8CE2
	for <lists+linux-samsung-soc@lfdr.de>; Mon,  9 Dec 2024 09:01:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4471C281AA0
	for <lists+linux-samsung-soc@lfdr.de>; Mon,  9 Dec 2024 08:01:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB1AD215167;
	Mon,  9 Dec 2024 08:01:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purelymail.com header.i=@purelymail.com header.b="bpNpBjfO"
X-Original-To: linux-samsung-soc@vger.kernel.org
Received: from sendmail.purelymail.com (sendmail.purelymail.com [34.202.193.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA815189B85
	for <linux-samsung-soc@vger.kernel.org>; Mon,  9 Dec 2024 08:01:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=34.202.193.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733731305; cv=none; b=Dcc8j7nChUzlgA4k2Yrp5ZZK5+jQHS39PaEN8fm5i2XZsxrI1mwC7jUkhQCWl7NxnVMaVq7y81dzIsQ7N0HSZAFdHy0QSZpVFyEBpHfoyarAoIgb2EY94mPMWEUQE/DjCVihU+ZKWJcG4BK8EfWCyW/3MHWbGtZ/H1TBj4sIQEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733731305; c=relaxed/simple;
	bh=WiBInClXAeRon+rmergp1g0wZ62ShFKtz6iZvduQAZM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=k5gA2AB1CcEZi+PW6CKiJxhQ6v4qES1LUlwnqiNi/wUmmMJ/hIrBIiJLOGOA29vB387pYfk/6W93bGF1/4VP5Uh+XFStYQslyivLKxlo00R1SphGEhRxMSrcYYUrayy929RXkTiv1etE6L7hpQNi5G8iTu1XBo/VlvwwhfNcmwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mentallysanemainliners.org; spf=pass smtp.mailfrom=mentallysanemainliners.org; dkim=pass (2048-bit key) header.d=purelymail.com header.i=@purelymail.com header.b=bpNpBjfO; arc=none smtp.client-ip=34.202.193.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mentallysanemainliners.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mentallysanemainliners.org
Authentication-Results: purelymail.com; auth=pass
DKIM-Signature: a=rsa-sha256; b=bpNpBjfOoNhNMpIXGj0p1j8UhAtkDs+AaPj16UiHLLmLKqVfNNXmOV/y/rYK08jStxvZBpFafVRnY6PZPWaNl/mRi5NUMlyqBtAVWs05ojSMoh+62OY685NvKuRUxUNMvKWgSaHomu6t9nvBbrkDdU96bwQorLJzuPln1paxT6oIHHbimzVPHBwOFZS6kJZ1zUidWeYjsGjnv7RlzLgc6NTo0XNcl+xZ6sOUll5uPjTk3NlXbQUSM2kh1F7q+4xaYvsUHlYrO3L4CueGvPQrJ2gZiMawIsjga27vQ93Wy+IVzD8tCIJpXml4reNdX05jIgv4EIXc/+NYJjBhAsm4hQ==; s=purelymail2; d=purelymail.com; v=1; bh=WiBInClXAeRon+rmergp1g0wZ62ShFKtz6iZvduQAZM=; h=Feedback-ID:Received:From:To:Subject:Date;
Feedback-ID: 68229:10037:null:purelymail
X-Pm-Original-To: linux-samsung-soc@vger.kernel.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 1477585645;
          (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
          Mon, 09 Dec 2024 08:01:18 +0000 (UTC)
From: Umer Uddin <umer.uddin@mentallysanemainliners.org>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	igor.belwon@mentallysanemainliners.org
Subject: [PATCH v7 4/4] arm64: dts: exynos: Add initial support for Samsung Galaxy S20 (x1slte)
Date: Mon,  9 Dec 2024 08:00:59 +0000
Message-ID: <20241209080059.11891-5-umer.uddin@mentallysanemainliners.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241209080059.11891-1-umer.uddin@mentallysanemainliners.org>
References: <20241209080059.11891-1-umer.uddin@mentallysanemainliners.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by Purelymail
Content-Type: text/plain; charset=UTF-8

Add initial support for the Samsung Galaxy S20 (x1slte/SM-G980F)
phone. It was launched in 2020, and it's based on the Exynos 990 SoC. It
has only one configuration with 8GB of RAM and 128GB of UFS 3.0 storage.

This device tree adds support for the following:

- SimpleFB
- 8GB RAM
- Buttons

Signed-off-by: Umer Uddin <umer.uddin@mentallysanemainliners.org>
---
 arch/arm64/boot/dts/exynos/Makefile           |  1 +
 .../boot/dts/exynos/exynos990-x1slte.dts      | 28 +++++++++++++++++++
 2 files changed, 29 insertions(+)
 create mode 100644 arch/arm64/boot/dts/exynos/exynos990-x1slte.dts

diff --git a/arch/arm64/boot/dts/exynos/Makefile b/arch/arm64/boot/dts/exyn=
os/Makefile
index fe47aafcd..ee73e1a2d 100644
--- a/arch/arm64/boot/dts/exynos/Makefile
+++ b/arch/arm64/boot/dts/exynos/Makefile
@@ -11,5 +11,6 @@ dtb-$(CONFIG_ARCH_EXYNOS) +=3D \
 =09exynos990-c1s.dtb=09=09\
 =09exynos990-r8s.dtb               \
 =09exynos990-x1s.dtb=09=09\
+=09exynos990-x1slte.dtb=09=09\
 =09exynosautov9-sadk.dtb=09=09\
 =09exynosautov920-sadk.dtb
diff --git a/arch/arm64/boot/dts/exynos/exynos990-x1slte.dts b/arch/arm64/b=
oot/dts/exynos/exynos990-x1slte.dts
new file mode 100644
index 000000000..d3720996b
--- /dev/null
+++ b/arch/arm64/boot/dts/exynos/exynos990-x1slte.dts
@@ -0,0 +1,28 @@
+// SPDX-License-Identifier: GPL-2.0 OR BSD-3-Clause
+/*
+ * Samsung Galaxy S20 (x1slte/SM-G980F) device tree source
+ *
+ * Copyright (c) 2024, Umer Uddin <umer.uddin@mentallysanemainliners.org>
+ */
+
+/dts-v1/;
+#include "exynos990-x1s-common.dtsi"
+
+/ {
+=09#address-cells =3D <2>;
+=09#size-cells =3D <2>;
+
+=09model =3D "Samsung Galaxy S20";
+=09compatible =3D "samsung,x1slte", "samsung,exynos990";
+
+=09memory@80000000 {
+=09=09device_type =3D "memory";
+=09=09reg =3D <0x0 0x80000000 0x0 0x3ab00000>,
+=09=09      /* Memory hole */
+=09=09      <0x0 0xc1200000 0x0 0x1ee00000>,
+=09=09      /* Memory hole */
+=09=09      <0x0 0xe1900000 0x0 0x1e700000>,
+=09=09      /* Memory hole */
+=09=09      <0x8 0x80000000 0x1 0x7ec00000>;
+=09};
+};
--=20
2.43.0


