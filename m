Return-Path: <linux-samsung-soc+bounces-10698-lists+linux-samsung-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D2421B41D31
	for <lists+linux-samsung-soc@lfdr.de>; Wed,  3 Sep 2025 13:39:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9270D3BA999
	for <lists+linux-samsung-soc@lfdr.de>; Wed,  3 Sep 2025 11:39:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 412062FB610;
	Wed,  3 Sep 2025 11:39:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="jKHDh4s2"
X-Original-To: linux-samsung-soc@vger.kernel.org
Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4D1D2FABED
	for <linux-samsung-soc@vger.kernel.org>; Wed,  3 Sep 2025 11:39:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756899581; cv=none; b=RReMElIJJHcCD+bWVsZ1yZPyd1l6JNQ1uNnmZSc4yoh0V2j8FD6T3Uo6fqGM1PpzETrwitulP0YU+uu3uiSr2+W763/qRAcpniBsx6PSCzo/qyBUOwGgeiYlxC9RjjNlUQLmAFuxcDnLfHhaEayjiyHVpXVFyximyiIzVf+/rbs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756899581; c=relaxed/simple;
	bh=DEKA94TkS8M4IPM3sEAm/5Qz3a9I4jWJINH3l1Tj/dY=;
	h=From:To:In-Reply-To:Subject:Date:Message-ID:MIME-Version:
	 Content-Type:References; b=jFv9Bfp28CKT+jYH9WK2QDJujLksI8hFr1OJNOQ7/jpX7HY6jJ/daADb9/4ZHwTR9FC7oLMCUfjbYJoVUTEsiUcM+JC9DBwLcbVihLMew6/EG1FW2luMSOpHDS+pbxSs6Ougs2WKhwzwRdPNbGNw2WfwfPRszp44fvlEdpOFgII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=jKHDh4s2; arc=none smtp.client-ip=203.254.224.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from epcas5p3.samsung.com (unknown [182.195.41.41])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20250903113937epoutp032bfd3c759a157141cc6d5ee2f073b167~hwtta0DtU0370903709epoutp03h
	for <linux-samsung-soc@vger.kernel.org>; Wed,  3 Sep 2025 11:39:37 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20250903113937epoutp032bfd3c759a157141cc6d5ee2f073b167~hwtta0DtU0370903709epoutp03h
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1756899577;
	bh=7brYymqqs4aIaN8Zo+JAkRMDFy6v/aAdvXLq9zLu890=;
	h=From:To:In-Reply-To:Subject:Date:References:From;
	b=jKHDh4s27/JoGOdzhZg27/I0d02Rhr6wRj9FbKmS9rkgC3AfYTlYPZSVbPgxZeIhj
	 tbvMN3XbmTKx/grFfAbs59jO4+sXWq0DUDSlUoRKhex8JuJHr+/RpylMEcRmCXKZHS
	 ORw36rWn0+swGH9JUYOix0FWLehVQPuX1xPZ7RL0=
Received: from epsnrtp01.localdomain (unknown [182.195.42.153]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPS id
	20250903113936epcas5p2a2fc50ab07b0fd777b4bee856b31511c~hwttCSEIa0673206732epcas5p2L;
	Wed,  3 Sep 2025 11:39:36 +0000 (GMT)
Received: from epcas5p3.samsung.com (unknown [182.195.38.93]) by
	epsnrtp01.localdomain (Postfix) with ESMTP id 4cH0yH46Bnz6B9m4; Wed,  3 Sep
	2025 11:39:35 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPA id
	20250903113935epcas5p3227334fa7684fe2170093c2851f27476~hwtrskr2T2284122841epcas5p3A;
	Wed,  3 Sep 2025 11:39:35 +0000 (GMT)
Received: from INBRO002520 (unknown [107.122.1.191]) by epsmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20250903113933epsmtip13e7d48e7582eba797719ac5d7c4a2873~hwtqTZwKo0781907819epsmtip1o;
	Wed,  3 Sep 2025 11:39:33 +0000 (GMT)
From: "Devang Tailor" <dev.tailor@samsung.com>
To: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<alim.akhtar@samsung.com>, <alexandre.belloni@bootlin.com>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-samsung-soc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-rtc@vger.kernel.org>, <faraz.ata@samsung.com>
In-Reply-To: <20250710083434.1821671-1-dev.tailor@samsung.com>
Subject: RE: [PATCH v2 0/3] On-chip RTC support for ExynosAutov9
Date: Wed, 3 Sep 2025 17:09:32 +0530
Message-ID: <000001dc1cc7$6bfee9d0$43fcbd70$@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQJ8w0UJjWiHDR7+9bjoByRdFpd+nAMc6yo9sycffmA=
Content-Language: en-in
X-CMS-MailID: 20250903113935epcas5p3227334fa7684fe2170093c2851f27476
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250710082533epcas5p111be26bea2ccc08718eebcb12929bbbf
References: <CGME20250710082533epcas5p111be26bea2ccc08718eebcb12929bbbf@epcas5p1.samsung.com>
	<20250710083434.1821671-1-dev.tailor@samsung.com>


Hi,


> -----Original Message-----
> From: Devang Tailor <dev.tailor=40samsung.com>
> Sent: 10 July 2025 14:05
> To: robh=40kernel.org; krzk+dt=40kernel.org; conor+dt=40kernel.org;
> alim.akhtar=40samsung.com; alexandre.belloni=40bootlin.com;
> devicetree=40vger.kernel.org; linux-arm-kernel=40lists.infradead.org; lin=
ux-
> samsung-soc=40vger.kernel.org; linux-kernel=40vger.kernel.org; linux-
> rtc=40vger.kernel.org; faraz.ata=40samsung.com
> Cc: Devang Tailor <dev.tailor=40samsung.com>
> Subject: =5BPATCH v2 0/3=5D On-chip RTC support for ExynosAutov9
>=20
> Enable on-chip RTC support. The on-chip RTC of this SoC is similar to the
> previous versions of Samsung SoC. So re-use the existing RTC driver with
> applicable call-backs for initialization and IRQ handling.
> Add a separate call-back for disabling RTC since existing '.disable'
> call-backs updates additional bit not valid for RTC of ExynosAutov9.
>=20
> Setting and getting hardware clock has been tested using 'hwclock'
> and 'date' utilities.
>=20
> Alarm interrupt has been checked with incrementing interrupt count via =
=22cat
> /proc/interrupts =7C grep rtc=22 for 10sec wakeup time via =22echo +10 >
> /sys/class/rtc/rtc0/wakealarm=22
>=20
> changelog
> ---
> Changes in v2:
> - Fixed the review comment of v1 for mis-aligmnent & asymmetry bit logic.
> - link for v1 : https://lore.kernel.org/linux-rtc/20250702052426.2404256-=
1-
> dev.tailor=40samsung.com/
>=20

Reminder=21
Can you please help to identify if anything is pending in this patch series=
 ? I see all three patches are reviewed.

>=20
> Devang Tailor (3):
>   dt-bindings: rtc: s3c-rtc: add compatible for exynosautov9
>   rtc: s3c: support for exynosautov9 on-chip RTC
>   arm64: dts: exynosautov9: add RTC DT node
>=20
>  .../devicetree/bindings/rtc/s3c-rtc.yaml       =7C  1 +
>  .../boot/dts/exynos/exynosautov9-sadk.dts      =7C  4 ++++
>  arch/arm64/boot/dts/exynos/exynosautov9.dtsi   =7C 10 ++++++++++
>  drivers/rtc/rtc-s3c.c                          =7C 18 ++++++++++++++++++
>  4 files changed, 33 insertions(+)
>=20
>=20
> base-commit: 58ba80c4740212c29a1cf9b48f588e60a7612209
> --
> 2.34.1



