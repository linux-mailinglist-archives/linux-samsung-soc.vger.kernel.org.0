Return-Path: <linux-samsung-soc+bounces-9577-lists+linux-samsung-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EBDBB1581E
	for <lists+linux-samsung-soc@lfdr.de>; Wed, 30 Jul 2025 06:26:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D5C2A18A5D44
	for <lists+linux-samsung-soc@lfdr.de>; Wed, 30 Jul 2025 04:27:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6138A1E1DE5;
	Wed, 30 Jul 2025 04:26:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="WTpxiXNo"
X-Original-To: linux-samsung-soc@vger.kernel.org
Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E14621D514E
	for <linux-samsung-soc@vger.kernel.org>; Wed, 30 Jul 2025 04:26:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.24
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753849592; cv=none; b=h+QZDDjsGyJDo8mdV6NHTU+HxiqbUAxFd/eAGcawQzwSGTE1iyIsnq/uvmUBxbp6CUc/PIbcDmWzflSh6RHSdYNioM7nn6VJbSSby+OOFS3XKsjOINWEyDQTwnNTj3w6OyOOF0g9/7Wh16VnQo1rc/t/tdRImtDSJwozIRSonRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753849592; c=relaxed/simple;
	bh=I12H13J2/EnsbpFY4Jno3735w5xfWZIGU+LWx/KGj6w=;
	h=From:To:In-Reply-To:Subject:Date:Message-ID:MIME-Version:
	 Content-Type:References; b=lEG7V7a1TpHAFrdygPaGSn6Qr8Xc5sppojHu6RVWC9875ftJAczCjm1A1aLRQMI8n057E4awWZYfmhEKxWVNKSghxybE3IGf3knyxChFoWRyVlkyNvLIfNBU16oEQOBjWu3rBD2q/XXwuhRlTQ67D7vBW6XWnm0dJKpvHjirM+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=WTpxiXNo; arc=none smtp.client-ip=203.254.224.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from epcas5p4.samsung.com (unknown [182.195.41.42])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20250730042626epoutp010fb62919fc937af23b9af95c8379e3c2~W7OgvrI6b2113221132epoutp01J
	for <linux-samsung-soc@vger.kernel.org>; Wed, 30 Jul 2025 04:26:26 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20250730042626epoutp010fb62919fc937af23b9af95c8379e3c2~W7OgvrI6b2113221132epoutp01J
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1753849586;
	bh=XADhAxJSJK7XTnD6xMYiRrgiWZbM/wAFycVV7wrUEWw=;
	h=From:To:In-Reply-To:Subject:Date:References:From;
	b=WTpxiXNo5hDwREZCQCpXkEmdBk9uwAq4fs7H8jEmZv9y8Vqtky7kB51qPKMP25TG7
	 vvD+dEiBY+yAZlhVXyQdaffReJVuztkJ2wmIYL5lCNBHZ6429ZK3gyHLWcKPpSJ//i
	 J5HfyxnrW+QYbpU74BPHrA3RV/hGsOr6ixVuXCFg=
Received: from epsnrtp01.localdomain (unknown [182.195.42.153]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPS id
	20250730042625epcas5p2bd1524fa52de5daae0afa6b10db513cf~W7Of3rIvi1492314923epcas5p23;
	Wed, 30 Jul 2025 04:26:25 +0000 (GMT)
Received: from epcas5p3.samsung.com (unknown [182.195.38.94]) by
	epsnrtp01.localdomain (Postfix) with ESMTP id 4bsK0c60mZz6B9mF; Wed, 30 Jul
	2025 04:26:24 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPA id
	20250730042624epcas5p35c34b8407135ac6b3ffd8f5e6f85eadb~W7OeGesCm1453314533epcas5p35;
	Wed, 30 Jul 2025 04:26:24 +0000 (GMT)
Received: from INBRO002756 (unknown [107.122.3.168]) by epsmtip2.samsung.com
	(KnoxPortal) with ESMTPA id
	20250730042622epsmtip2189c4cceaa19ce310300f1e31e526d55~W7OcshZbi0895408954epsmtip2K;
	Wed, 30 Jul 2025 04:26:22 +0000 (GMT)
From: "Alim Akhtar" <alim.akhtar@samsung.com>
To: "'Devang Tailor'" <dev.tailor@samsung.com>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<alexandre.belloni@bootlin.com>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-samsung-soc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-rtc@vger.kernel.org>,
	<faraz.ata@samsung.com>
In-Reply-To: <20250710083434.1821671-4-dev.tailor@samsung.com>
Subject: RE: [PATCH v2 3/3] arm64: dts: exynosautov9: add RTC DT node
Date: Wed, 30 Jul 2025 09:56:21 +0530
Message-ID: <36d501dc010a$1ba82f60$52f88e20$@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-us
Thread-Index: AQMc6yo9jRPgA4nZ2IiZrgLtyBFMygGaMzhCAmY8HSqxqDjnIA==
X-CMS-MailID: 20250730042624epcas5p35c34b8407135ac6b3ffd8f5e6f85eadb
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250710082538epcas5p2556f80b4193a046262808ae7742675be
References: <20250710083434.1821671-1-dev.tailor@samsung.com>
	<CGME20250710082538epcas5p2556f80b4193a046262808ae7742675be@epcas5p2.samsung.com>
	<20250710083434.1821671-4-dev.tailor@samsung.com>



> -----Original Message-----
> From: Devang Tailor <dev.tailor=40samsung.com>
> Sent: Thursday, July 10, 2025 2:05 PM
> To: robh=40kernel.org; krzk+dt=40kernel.org; conor+dt=40kernel.org;
> alim.akhtar=40samsung.com; alexandre.belloni=40bootlin.com;
> devicetree=40vger.kernel.org; linux-arm-kernel=40lists.infradead.org; lin=
ux-
> samsung-soc=40vger.kernel.org; linux-kernel=40vger.kernel.org; linux-
> rtc=40vger.kernel.org; faraz.ata=40samsung.com
> Cc: Devang Tailor <dev.tailor=40samsung.com>
> Subject: =5BPATCH v2 3/3=5D arm64: dts: exynosautov9: add RTC DT node
>=20
> Add DT node for on-chip RTC for ExynosAutov9
>=20
> Signed-off-by: Devang Tailor <dev.tailor=40samsung.com>
> ---
Reviewed-by: Alim Akhtar <alim.akhtar=40samsung.com>

You can also send a top-up patch to correct the ordering of the nodes based=
 on the ascending addresses.

>  arch/arm64/boot/dts/exynos/exynosautov9-sadk.dts =7C  4 ++++
>  arch/arm64/boot/dts/exynos/exynosautov9.dtsi     =7C 10 ++++++++++
>  2 files changed, 14 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/exynos/exynosautov9-sadk.dts
> b/arch/arm64/boot/dts/exynos/exynosautov9-sadk.dts
> index de2c1de51a76..5f5167571f7a 100644
> --- a/arch/arm64/boot/dts/exynos/exynosautov9-sadk.dts
> +++ b/arch/arm64/boot/dts/exynos/exynosautov9-sadk.dts
> =40=40 -106,6 +106,10 =40=40 &pwm =7B
>  	status =3D =22okay=22;
>  =7D;
>=20
> +&rtc =7B
> +	status =3D =22okay=22;
> +=7D;
> +
>  &serial_0 =7B
>  	pinctrl-0 =3D <&uart0_bus_dual>;
>  	status =3D =22okay=22;
> diff --git a/arch/arm64/boot/dts/exynos/exynosautov9.dtsi
> b/arch/arm64/boot/dts/exynos/exynosautov9.dtsi
> index 66628cb32776..afa6b258153c 100644
> --- a/arch/arm64/boot/dts/exynos/exynosautov9.dtsi
> +++ b/arch/arm64/boot/dts/exynos/exynosautov9.dtsi
> =40=40 -1633,6 +1633,16 =40=40 pwm: pwm=40103f0000 =7B
>  			clock-names =3D =22timers=22;
>  			status =3D =22disabled=22;
>  		=7D;
> +
> +		rtc: rtc=4010540000 =7B
> +			compatible =3D =22samsung,exynosautov9-rtc=22;
> +			reg =3D <0x10540000 0x100>;
> +			interrupts =3D <GIC_SPI 26 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 27 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks =3D <&xtcxo>;
> +			clock-names =3D =22rtc=22;
> +			status =3D =22disabled=22;
> +		=7D;
>  	=7D;
>  =7D;
>=20
> --
> 2.34.1



