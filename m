Return-Path: <linux-samsung-soc+bounces-9460-lists+linux-samsung-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B7F92B10050
	for <lists+linux-samsung-soc@lfdr.de>; Thu, 24 Jul 2025 07:58:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B140C4E1605
	for <lists+linux-samsung-soc@lfdr.de>; Thu, 24 Jul 2025 05:57:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9483213E7A;
	Thu, 24 Jul 2025 05:58:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="CKRSIVlJ"
X-Original-To: linux-samsung-soc@vger.kernel.org
Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB3FB213237
	for <linux-samsung-soc@vger.kernel.org>; Thu, 24 Jul 2025 05:58:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.24
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753336685; cv=none; b=H7fLMl6liVd+vMLbkXMuDK4OWgUtZRUaKbCS+kKrBRrTh0J0Y+ebLJCfZwOgujxbKsTvnGC4uhW2WO47J8mJ0BQmZuebzkI9+R8kP9u7cgXnAN1fIyrjWU0B7qGaGT3NTHSapKvlIP4j1rYs/9fq226l6/Fgvx8WyCti71dwnCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753336685; c=relaxed/simple;
	bh=Fm1t4Dx5fq568tyQqIDPWrBwjE0Dep2vHtcZTzx/br4=;
	h=From:To:Cc:In-Reply-To:Subject:Date:Message-ID:MIME-Version:
	 Content-Type:References; b=PJsAtGJ2+ldlUrfWRZtgON/i0MGoP7I3ZnNJKqjw+hm0LugXxDTPvmAqqr82vJK1rr5Xigs4D7kpBaz3BaSgme+ifdDm+F+JVKMWH0v0wo+diIHI0WV7ocetqkVS+ISOn6y4qebXJKlC98EK3CiBgXZJ6ZPhaQ7F+RuWQkO+/nU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=CKRSIVlJ; arc=none smtp.client-ip=203.254.224.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20250724055752epoutp0165a08e6724d56847db0e26655313930e~VGmoFlbIH0059100591epoutp01B
	for <linux-samsung-soc@vger.kernel.org>; Thu, 24 Jul 2025 05:57:52 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20250724055752epoutp0165a08e6724d56847db0e26655313930e~VGmoFlbIH0059100591epoutp01B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1753336672;
	bh=PNNWLX2zLaDJhWpiM9e2CQIZp31IKOkktSa/xRb2XIM=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=CKRSIVlJ//gOEd1lLCtOMtbl5FGqyuy85kYyYYLSYsa132Hw/ejREDjbCwmEMmJpc
	 jX3DJhv0aK7UUdP91ah2sXHbZjzfVNJKgZNB5F7YEgzkJSjp5pKZ0iXuSbH1MLYFRA
	 kvVkDTT+dbFDSt6muSLSGURt2jUzjqs7PfosHSMA=
Received: from epsnrtp02.localdomain (unknown [182.195.42.154]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPS id
	20250724055751epcas5p417b17b4f7d64d2ea7810f1df38548aca~VGmm-hkza0591505915epcas5p4h;
	Thu, 24 Jul 2025 05:57:51 +0000 (GMT)
Received: from epcas5p2.samsung.com (unknown [182.195.38.92]) by
	epsnrtp02.localdomain (Postfix) with ESMTP id 4bngJt1mqTz2SSKX; Thu, 24 Jul
	2025 05:57:50 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPA id
	20250724055749epcas5p2035c7876f3b871955b09d24de701194b~VGmlCT0Br2947129471epcas5p2B;
	Thu, 24 Jul 2025 05:57:49 +0000 (GMT)
Received: from INBRO002756 (unknown [107.122.3.168]) by epsmtip2.samsung.com
	(KnoxPortal) with ESMTPA id
	20250724055748epsmtip26e8e1115bb4da53755857ace1f4a54f2~VGmj_Yr_G0141901419epsmtip2L;
	Thu, 24 Jul 2025 05:57:48 +0000 (GMT)
From: "Alim Akhtar" <alim.akhtar@samsung.com>
To: "'Sangwook Shin'" <sw617.shin@samsung.com>, <krzk@kernel.org>,
	<wim@linux-watchdog.org>, <linux@roeck-us.net>
Cc: <linux-arm-kernel@lists.infradead.org>,
	<linux-samsung-soc@vger.kernel.org>, <linux-watchdog@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
In-Reply-To: <20250714055440.3138135-4-sw617.shin@samsung.com>
Subject: RE: [PATCH v3 RESEND 3/5] watchdog: s3c2410_wdt: Increase max
 timeout value of watchdog
Date: Thu, 24 Jul 2025 11:27:47 +0530
Message-ID: <2b5e01dbfc5f$e298d0c0$a7ca7240$@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-us
Thread-Index: AQIEaJ+ioIR5Yp9zWAA/UcLZjjUhMgF6s7ZMAnq+8xuz0EHcsA==
X-CMS-MailID: 20250724055749epcas5p2035c7876f3b871955b09d24de701194b
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250714055858epcas2p47b849c0141fdb556288333f7abe00372
References: <20250714055440.3138135-1-sw617.shin@samsung.com>
	<CGME20250714055858epcas2p47b849c0141fdb556288333f7abe00372@epcas2p4.samsung.com>
	<20250714055440.3138135-4-sw617.shin@samsung.com>

Hi Sangwook

> -----Original Message-----
> From: Sangwook Shin <sw617.shin=40samsung.com>
> Sent: Monday, July 14, 2025 11:25 AM
> To: krzk=40kernel.org; alim.akhtar=40samsung.com; wim=40linux-watchdog.or=
g;
> linux=40roeck-us.net
> Cc: linux-arm-kernel=40lists.infradead.org; linux-samsung-
> soc=40vger.kernel.org; linux-watchdog=40vger.kernel.org; linux-
> kernel=40vger.kernel.org; Sangwook Shin <sw617.shin=40samsung.com>
> Subject: =5BPATCH v3 RESEND 3/5=5D watchdog: s3c2410_wdt: Increase max
> timeout value of watchdog
>=20
> Increase max_timeout value from 55s to 3664647s (1017h 57min 27s) with
> 38400000 frequency system if the system has 32-bit WTCNT register.
>=20
> cat
> /sys/devices/platform/10060000.watchdog_cl0/watchdog/watchdog0/max_t
> imeout
> 3664647
>=20
> =5B    0.302473=5D s3c2410-wdt 10060000.watchdog_cl0: Heartbeat:
> count=3D1099394100000, timeout=3D3664647, freq=3D300000
> =5B    0.302479=5D s3c2410-wdt 10060000.watchdog_cl0: Heartbeat:
> timeout=3D3664647, divisor=3D256, count=3D1099394100000 (fff8feac)
> =5B    0.302510=5D s3c2410-wdt 10060000.watchdog_cl0: starting watchdog t=
imer
> =5B    0.302722=5D s3c2410-wdt 10060000.watchdog_cl0: watchdog active, re=
set
> enabled, irq disabled
>=20
> If system has 32-bit WTCNT, add QUIRK_HAS_32BIT_MAXCNT to its quirk
> flags, then it will operation with 32-bit counter. If not, with 16-bit co=
unter like
> previous.
>=20
As Krzysztof commented, please merge this patch with the next patch so that=
 Quirk and it consumer is part of the same patch.=20
Once you have done that, feel free to add
Reviewed-by: Alim Akhtar <alim.akhtar=40samsung.com>



