Return-Path: <linux-samsung-soc+bounces-6837-lists+linux-samsung-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A5A9AA36E7B
	for <lists+linux-samsung-soc@lfdr.de>; Sat, 15 Feb 2025 14:29:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EA16F3B25AC
	for <lists+linux-samsung-soc@lfdr.de>; Sat, 15 Feb 2025 13:29:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 257281C701C;
	Sat, 15 Feb 2025 13:29:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZWLWWDkj"
X-Original-To: linux-samsung-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D05DA1A262D;
	Sat, 15 Feb 2025 13:29:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739626179; cv=none; b=fxWR99j2k1kUkBXkXLRES69d0gOSWruLepIb7K/6x6RVmVon4bfscGNVqNM+RgZ1+nMKVmZW30uIdoS2hmXZ5Ao9nJIhSc9lDQTdBIL7JRy3jGStS9nzmpS/+Aj7aMPbdb9Um7W8QEcsAEikAv3e+XHDKOMRsoATmh8lQ8q9ONE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739626179; c=relaxed/simple;
	bh=k40pzK1X79s+z6fpQsmQlU2BYJ+/ZjGGtejZR++BQ+Q=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=jKtcyS8xvI/Nv0COUA41lgQxSsLFIW6buOrfwH1ho64pd+XrQCjTZ6MEU541SFfadhaZX8l+gz3/Ehqjveh0frtSyHux9/x/RgXO2pJL3uVRa8lTXRjpwuUUgdw75xLFJCJ88gSfNmxnEgzXpEf+m4KtxZ/T/Uo/n+OeCcnqHEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZWLWWDkj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29A27C4CEDF;
	Sat, 15 Feb 2025 13:29:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739626179;
	bh=k40pzK1X79s+z6fpQsmQlU2BYJ+/ZjGGtejZR++BQ+Q=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=ZWLWWDkjTgH38wQ58i+33SPUXdx2MkdONt7xOanhGnnvhKaz88Rvbm4IrB36h0DjM
	 FovtO81IQDykZ2khWnojpXM4eqNI9FeOmqQvpP9BLSApZsP4OcgP1Cxpf6b1Yu1Hmt
	 nx73NRuXCkX7OUp/aEnQGuDp0BTRqj55Uev1q0hCxNSpZylgGjtSTFrR3MI9XXeVI0
	 gUpDdFkzLwtv+8s6SGbuXKg9ZVvgIPPHnOTsMHyf9xnAfMJS7EbO5hFPfNQggxDdwt
	 aXMOfSwNXMKIb3RuhjRR9dOLY7W7enw7mzHQTzSt0EWOyIIncys2Zd1kCAktD30qei
	 zEwa86Tgif6KQ==
Date: Sat, 15 Feb 2025 07:29:38 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Kishon Vijay Abraham I <kishon@kernel.org>, devicetree@vger.kernel.org, 
 Vinod Koul <vkoul@kernel.org>, linux-phy@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, linux-arm-kernel@lists.infradead.org, 
 Philipp Zabel <p.zabel@pengutronix.de>, Conor Dooley <conor+dt@kernel.org>
To: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
In-Reply-To: <20250215122409.162810-2-ivo.ivanov.ivanov1@gmail.com>
References: <20250215122409.162810-1-ivo.ivanov.ivanov1@gmail.com>
 <20250215122409.162810-2-ivo.ivanov.ivanov1@gmail.com>
Message-Id: <173962617692.765204.2321221334905169840.robh@kernel.org>
Subject: Re: [PATCH v1 1/4] dt-bindings: phy: add
 samsung,exynos2200-snps-eusb2-phy schema file


On Sat, 15 Feb 2025 14:24:06 +0200, Ivaylo Ivanov wrote:
> The Exynos2200 SoC uses Synopsis eUSB2 PHY. Add a dt-binding schema
> for the new driver.
> 
> Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
> ---
>  .../samsung,exynos2200-snps-eusb2-phy.yaml    | 75 +++++++++++++++++++
>  1 file changed, 75 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/phy/samsung,exynos2200-snps-eusb2-phy.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/phy/samsung,exynos2200-snps-eusb2-phy.example.dts:18:18: fatal error: dt-bindings/clock/samsung,exynos2200.h: No such file or directory
   18 |         #include <dt-bindings/clock/samsung,exynos2200.h>
      |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
compilation terminated.
make[2]: *** [scripts/Makefile.dtbs:131: Documentation/devicetree/bindings/phy/samsung,exynos2200-snps-eusb2-phy.example.dtb] Error 1
make[2]: *** Waiting for unfinished jobs....
make[1]: *** [/builds/robherring/dt-review-ci/linux/Makefile:1511: dt_binding_check] Error 2
make: *** [Makefile:251: __sub-make] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250215122409.162810-2-ivo.ivanov.ivanov1@gmail.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


