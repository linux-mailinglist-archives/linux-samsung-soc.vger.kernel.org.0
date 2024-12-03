Return-Path: <linux-samsung-soc+bounces-5549-lists+linux-samsung-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F2409E1531
	for <lists+linux-samsung-soc@lfdr.de>; Tue,  3 Dec 2024 09:09:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 623FA1619C6
	for <lists+linux-samsung-soc@lfdr.de>; Tue,  3 Dec 2024 08:09:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C9FB1DF278;
	Tue,  3 Dec 2024 08:03:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mentallysanemainliners.org header.i=@mentallysanemainliners.org header.b="kHyKHnmm"
X-Original-To: linux-samsung-soc@vger.kernel.org
Received: from out-02.smtp.spacemail.com (out-02.smtp.spacemail.com [63.250.43.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D21511E2845;
	Tue,  3 Dec 2024 08:03:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=63.250.43.87
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733213029; cv=none; b=SPw9mJEgY2FHFBbnEYLT7Omj4ouxSrojPCJDiJPhZfFTJYA/V9biubUifSOb9/YhLZrL5xOKIAjEX1rhl3nl+qGju98sQ5evMGMQmPUelCFdztx5g06Pv6pzJA99QBD6PfyislZiADTdSUHQz3DAhJpc7Vmuqk2hMvD7d8CPWWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733213029; c=relaxed/simple;
	bh=kcw5+G9rY6xp1Qehwwoa6TUJ3H3B/nYN980UOcXsUw4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=i5bbcclIF0XFAkJ1subTuzsIwY1B9/VaIY4XxoA/gvaz94T7UVrKmA5m6R7wj9TbrgS9DsvxGjDXjel0vEh6aON58iiZUSmzWKp4SuDIt9Qdu08XhKuFrSEO/Kv94YqPYVXSWzCZiGcYX46GIhKZ3+dpt/v/XieNL5POlQxAMNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mentallysanemainliners.org; spf=pass smtp.mailfrom=mentallysanemainliners.org; dkim=pass (2048-bit key) header.d=mentallysanemainliners.org header.i=@mentallysanemainliners.org header.b=kHyKHnmm; arc=none smtp.client-ip=63.250.43.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mentallysanemainliners.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mentallysanemainliners.org
Received: from prod-lbout-phx.jellyfish.systems (unknown [198.177.122.3])
	by smtp.spacemail.com (Postfix) with ESMTPA id 4Y2Y7j4CWLz4w8K;
	Tue, 03 Dec 2024 08:03:45 +0000 (UTC)
Received: from umer-b550pro4.lan (host-213-78-252-153.as13285.net [213.78.252.153])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.spacemail.com (Postfix) with ESMTPSA id 4Y2Y7Y5TFyz2x99;
	Tue,  3 Dec 2024 08:03:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=mentallysanemainliners.org; s=spacemail; t=1733213020;
	bh=kcw5+G9rY6xp1Qehwwoa6TUJ3H3B/nYN980UOcXsUw4=;
	h=From:To:Cc:Subject:Date:From;
	b=kHyKHnmmBHPMkhySYoYbRoh9R1/ASp/AnQlM9kcbSHIQK+93dH7HqLBzThr/LpfJ8
	 pt8RBOqCFTR4DXIoDjXXBjEkeW2kiwmm833215Tbg6tL0UJC+ZT3kNLJQNe+3jJsCQ
	 UaoGKIzuNfLYeeqU2umeS60HbgVwysL7n84wKg9FWNcDoCjFNUuO6+fL19/B6BYvsk
	 KlZ/vBRZd93GYgUSoUCGOKynQZE/biB98sXn0BPHyTVSGeNignEkloztyh8BV4qOsW
	 zPxLS0RBwoIt/7WkSFipOp5pBgGD0tnsRyHriXLR5s880wql0wLkn9v/jkTTEF6EwB
	 s9hP56W4xI46w==
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
Subject: [PATCH v4 0/4] Add minimal Samsung Galaxy S20 Series board, SM-G981B and SM-G980F support
Date: Tue,  3 Dec 2024 08:03:22 +0000
Message-ID: <20241203080327.4751-1-umer.uddin@mentallysanemainliners.org>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi folks,

This series adds initial support for the Samsung Galaxy S20 Series and also
initial board support for the Samsung Galaxy S20 5G (SM-G981B)
codenamed x1s.

The S20 Series feature a lot of similarities in their configuration
and internally Samsung named the common devicetrees in their
downstream kernel 'hubble', please note hubble excludes the
S20 FE series and Note20 series. To accomodate this, I've
now named the device tree common's matching the codenames
(x1s-common).
The device trees have been tested with dtbs_check W=1
and results in no warnings.

This initial bringup consists of:
 * pinctrl
 * gpio-keys
 * simple-framebuffer

This is enough to reach a shell in an initramfs. More platform support
will be added in the future.

Just like SM-N981B, the preferred way to boot the upstream kernel is
by using a shim bootloader, called uniLoader [1], which works around
some issues with the stock, non-replacable Samsung S-LK bootloader.
For example, the stock bootloader leaves the decon trigger control
unset, which causes the framebuffer not to refresh.

Device functionality depends on the patch series from Igor Belwon:
"Add minimal Exynos990 SoC and SM-N981B support"

[1] https://github.com/ivoszbg/uniLoader

Changes in v4:
 - Rebase from krzk's kernel tree to accomodate
   for the merge of r8s
 - Rename exynos990-hubble-common.dtsi
   to exynos990-x1s-common.dtsi

Changes in v3:
 - Fix oversight in yaml
 - Decommonise memory map

Changes in v2:
 - Add Samsung Galaxy S20 into device tree bindings
 - Add support for Samsung Galaxy S20 as well as the 5G variant now
 - Fix typo in Samsung Galaxy S20 5G commit message

Kind regards,
Umer

Umer Uddin (4):
  dt-bindings: arm: samsung: samsung-boards: Add bindings for SM-G981B
    and SM-G980F board
  arm64: dts: exynos: Add initial support for Samsung Galaxy S20 Series
    boards (hubble)
  arm64: dts: exynos: Add initial support for Samsung Galaxy S20 5G
    (x1s)
  arm64: dts: exynos: Add initial support for Samsung Galaxy S20
    (x1slte)

 .../bindings/arm/samsung/samsung-boards.yaml  |  2 +
 arch/arm64/boot/dts/exynos/Makefile           |  2 +
 .../boot/dts/exynos/exynos990-x1s-common.dtsi | 98 +++++++++++++++++++
 arch/arm64/boot/dts/exynos/exynos990-x1s.dts  | 28 ++++++
 .../boot/dts/exynos/exynos990-x1slte.dts      | 28 ++++++
 5 files changed, 158 insertions(+)
 create mode 100644 arch/arm64/boot/dts/exynos/exynos990-x1s-common.dtsi
 create mode 100644 arch/arm64/boot/dts/exynos/exynos990-x1s.dts
 create mode 100644 arch/arm64/boot/dts/exynos/exynos990-x1slte.dts

-- 
2.47.1


