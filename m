Return-Path: <linux-samsung-soc+bounces-3547-lists+linux-samsung-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C0BAF9140E2
	for <lists+linux-samsung-soc@lfdr.de>; Mon, 24 Jun 2024 05:55:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 363F01F223E6
	for <lists+linux-samsung-soc@lfdr.de>; Mon, 24 Jun 2024 03:55:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9BA8C8C0;
	Mon, 24 Jun 2024 03:54:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="k8zeQwfl"
X-Original-To: linux-samsung-soc@vger.kernel.org
Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B66179CF
	for <linux-samsung-soc@vger.kernel.org>; Mon, 24 Jun 2024 03:54:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.24
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719201292; cv=none; b=nEz9m8vMSWqYJpCxyAc+qdUKQ0mSeXlzAMJi3BnAGEUQ8onXCS3J2rV5yviwKee+DOuK8P/4SeG5YLaTVZH/lNZ4Nh1pq3IlzVYWg/MJFIlnMVzE6sBdsvV5hJ0iEOEbAt/8xNfHh6lhV2p/xmjEXmdT9nqkbvR696+Muut8Hvs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719201292; c=relaxed/simple;
	bh=Zc1G58S987d+el+u1+AlUzsI3ZSigu0cmPDGn/VeKa8=;
	h=From:To:Cc:In-Reply-To:Subject:Date:Message-ID:MIME-Version:
	 Content-Type:References; b=Oe3jj4qTeAl2WHa33hQsGvkqsjDfNcxSDQfyZ17guYcH+/IxTWTBPXhl7GBU1agprDl+xRtIv3OWKbqmmtBGKd/d+UKPQ4Vx4+0EU2nVZGOiYs3HJAytxeC8MS2YLOLi7D+sMnfIllHylfItordLi4eoFazWLaJ9CUUnANswkTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=k8zeQwfl; arc=none smtp.client-ip=203.254.224.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from epcas5p3.samsung.com (unknown [182.195.41.41])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20240624035446epoutp01bdba6456b54d1ee1e21b8ab6bb55da80~b1HYF617E0168201682epoutp01T
	for <linux-samsung-soc@vger.kernel.org>; Mon, 24 Jun 2024 03:54:46 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20240624035446epoutp01bdba6456b54d1ee1e21b8ab6bb55da80~b1HYF617E0168201682epoutp01T
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1719201286;
	bh=1gwMpg1FSojtQv2ige2kDbRM3MdZHJDiiqG2X6+2uXU=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=k8zeQwflkZyFbBcCAM5toauerSWAOldJBEBp1jRWJIuSnQRSdOjYzlKV1byTOLf2X
	 oFxpljNGGpceFkrqrzBPrUsX4R3A/Y4suKaOD9Yr9+FJIrQWh7FbE+XVBmsZdC1Vw3
	 3zj8pekrTxXZoMHp809/i/ixAL5LTXVigsqychR8=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTP id
	20240624035445epcas5p110677d4099008c58d6191fcc7fe62201~b1HXffWmy0589905899epcas5p1r;
	Mon, 24 Jun 2024 03:54:45 +0000 (GMT)
Received: from epsmgec5p1-new.samsung.com (unknown [182.195.38.182]) by
	epsnrtp3.localdomain (Postfix) with ESMTP id 4W6vGz45pmz4x9QC; Mon, 24 Jun
	2024 03:54:35 +0000 (GMT)
Received: from epcas5p4.samsung.com ( [182.195.41.42]) by
	epsmgec5p1-new.samsung.com (Symantec Messaging Gateway) with SMTP id
	A2.78.19174.AFDE8766; Mon, 24 Jun 2024 12:54:34 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPA id
	20240624035434epcas5p34510617c66b9c9e9aa7065e5f4868d5f~b1HNAjn2W0067300673epcas5p3d;
	Mon, 24 Jun 2024 03:54:34 +0000 (GMT)
Received: from epsmgmcp1.samsung.com (unknown [182.195.42.82]) by
	epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20240624035434epsmtrp1e8b03d59cf57b9d0efe2055579f5abca~b1HM-g-Y33258732587epsmtrp1v;
	Mon, 24 Jun 2024 03:54:34 +0000 (GMT)
X-AuditID: b6c32a50-87fff70000004ae6-3b-6678edfa7276
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
	epsmgmcp1.samsung.com (Symantec Messaging Gateway) with SMTP id
	F5.F9.18846.AFDE8766; Mon, 24 Jun 2024 12:54:34 +0900 (KST)
Received: from INBRO002756 (unknown [107.122.12.5]) by epsmtip2.samsung.com
	(KnoxPortal) with ESMTPA id
	20240624035432epsmtip2520399a809abfbaee322b9b2a2284892~b1HLGkON-2975829758epsmtip2O;
	Mon, 24 Jun 2024 03:54:32 +0000 (GMT)
From: "Alim Akhtar" <alim.akhtar@samsung.com>
To: "'Vishnu Reddy'" <vishnu.reddy@samsung.com>,
	<krzysztof.kozlowski@linaro.org>, <s.nawrocki@samsung.com>,
	<linus.walleij@linaro.org>
Cc: <linux-arm-kernel@lists.infradead.org>,
	<linux-samsung-soc@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <pankaj.dubey@samsung.com>,
	<ravi.patel@samsung.com>, <gost.dev@samsung.com>
In-Reply-To: <20240620103410.35786-1-vishnu.reddy@samsung.com>
Subject: RE: [PATCH v2] pinctrl: samsung: Add support for pull-up and
 pull-down
Date: Mon, 24 Jun 2024 09:24:30 +0530
Message-ID: <000001dac5ea$39660f60$ac322e20$@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQJsl4iGk1jvO+hY9fFKxJSBqey3YQJX8oCQsJ/lN+A=
Content-Language: en-us
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrOJsWRmVeSWpSXmKPExsWy7bCmlu6vtxVpBgdXq1jcPLCTyWLv663s
	FlP+LGey2PT4GqvF5vl/GC0u75rDZjHj/D4mi0Vbv7BbPPywh93i8Jt2Vot506McuD3uXNvD
	5rF5Sb1H35ZVjB6fN8kFsERl22SkJqakFimk5iXnp2TmpdsqeQfHO8ebmhkY6hpaWpgrKeQl
	5qbaKrn4BOi6ZeYA3aSkUJaYUwoUCkgsLlbSt7Mpyi8tSVXIyC8usVVKLUjJKTAp0CtOzC0u
	zUvXy0stsTI0MDAyBSpMyM7Y0vGerWAKe8Xdc5NYGhh72LoYOTkkBEwkXt8+w9zFyMUhJLCH
	UeLBzH4WCOcTo8Tyl4sQnHuvHzN2MXKAtZxeJAsR38koMX3+MSYI5wWjxKRL/1lB5rIJ6Ers
	WNwGtkNEoJtR4vW5SJAiZoGHjBIT738CK+IUsJM4t2UWI4gtLBAo0fzqPguIzSKgKjFhbxeY
	zStgKdEwrYENwhaUODnzCVicWUBeYvvbOcwQTyhI/Hy6jBVimZXE9ncf2SFqxCVeHj3CDlGz
	kkPi7l0BiA9cJB42xEOEhSVeHd8CVSIl8bK/DcrOljh+cRY0jCokuls/QsXtJXY+uskCMoZZ
	QFNi/S59iE18Er2/nzBBTOeV6GgTgqhWlWh+d5UFwpaWmNjdzQphe0g07vzMOIFRcRaSv2Yh
	+WsWkvtnISxbwMiyilEqtaA4Nz012bTAUDcvtRwe38n5uZsYwSlWK2AH4+oNf/UOMTJxMB5i
	lOBgVhLhnV5flibEm5JYWZValB9fVJqTWnyI0RQY2hOZpUST84FJPq8k3tDE0sDEzMzMxNLY
	zFBJnPd169wUIYH0xJLU7NTUgtQimD4mDk6pBibtCwyXXbsCwutvSE5QLzYMWOw0M6W2KnK7
	7vS9D05P85pv0z3laJwe98xyA+Gjcbr+PblcrMvvnd2bctrjY0BovZCs2e0MjVabhz9kudI8
	khgabr5RDb4Q3bFYlSXX81mb7e4/HgZnL6wuO7VKUUW5KcBQ+FfrXz6d9asvuCo/82F+yaah
	49+Yb3hjwX3B6IOv+EJsbHXU7l31+GMixzz/N2uQxe7ftY/l/srLb+Xo9nesuvM6u27nygBJ
	K8Nsl5ssYl+WzKu4utn+qGbylyjTC3c5bZ02H8+Jnmr24fP/O3OWe7d9rXtXsWpLxzr576XR
	+yoac7+/Z8npM+S2blTqKZmf06s87XC9zZXZSizFGYmGWsxFxYkAzcPxVjoEAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFuplkeLIzCtJLcpLzFFi42LZdlhJXvfX24o0g2d/2SxuHtjJZLH39VZ2
	iyl/ljNZbHp8jdVi8/w/jBaXd81hs5hxfh+TxaKtX9gtHn7Yw25x+E07q8W86VEO3B53ru1h
	89i8pN6jb8sqRo/Pm+QCWKK4bFJSczLLUov07RK4MrZ0vGcrmMJecffcJJYGxh62LkYODgkB
	E4nTi2S7GLk4hAS2M0qc+NPH1MXICRSXlri+cQI7hC0ssfLfc3aIomeMEhvnt7GAJNgEdCV2
	LG5jA0mICPQySqx9fwvMYRZ4ziix6cU8JoiWfkaJ1009rCAtnAJ2Eue2zGIE2S0s4C8x4bAO
	SJhFQFViwt4usKm8ApYSDdMa2CBsQYmTM5+AxZkFtCWe3nwKZctLbH87hxniPAWJn0+XgY0X
	EbCS2P7uIztEjbjEy6NH2CcwCs9CMmoWklGzkIyahaRlASPLKkbR1ILi3PTc5AJDveLE3OLS
	vHS95PzcTYzgGNMK2sG4bP1fvUOMTByMhxglOJiVRHin15elCfGmJFZWpRblxxeV5qQWH2KU
	5mBREudVzulMERJITyxJzU5NLUgtgskycXBKNTB1LrJpqpnlwe8YeerttvVvjKdf4joeqrLo
	VsO+GxIeC89n5Tsob3JLv3BWMvyBWJl922G1yD5+ZqWbfdU7qrblx20RSPqiaX/2rPBpK8e1
	ooIXhK15eg+/NWdl3Fr9xmDmktsH/PSZvlk+OnPa9PtthsB/C61d+lmzEz/1BIk1ftMq/eYc
	wnjSql1yVr1AsNaeM08FX5/rmLfo/ssdovc4Pks2ZvtUrdCf1z6Xe2m0qFHXZ5NS76r0TOHw
	3u2iD088NWjskoz/e5zzHXPWHq8zdVbvbTYfEq/91rLw+mbB5Mnn593fccnxj9nH5W9dH846
	/fhJNYfKofMJkx6sarb6P2O31mnBeYa284rz5ncpsRRnJBpqMRcVJwIAc4VU3SADAAA=
X-CMS-MailID: 20240624035434epcas5p34510617c66b9c9e9aa7065e5f4868d5f
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20240620103950epcas5p10514d4a19bdfd505d7d92ceb1fe10cc7
References: <CGME20240620103950epcas5p10514d4a19bdfd505d7d92ceb1fe10cc7@epcas5p1.samsung.com>
	<20240620103410.35786-1-vishnu.reddy@samsung.com>

Hi Vishnu

> -----Original Message-----
> From: Vishnu Reddy <vishnu.reddy@samsung.com>
> Sent: Thursday, June 20, 2024 4:04 PM
> To: krzysztof.kozlowski@linaro.org; s.nawrocki@samsung.com;
> alim.akhtar@samsung.com; linus.walleij@linaro.org
> Cc: linux-arm-kernel@lists.infradead.org; linux-samsung-
> soc@vger.kernel.org; linux-gpio@vger.kernel.org; linux-
> kernel@vger.kernel.org; pankaj.dubey@samsung.com;
> ravi.patel@samsung.com; gost.dev@samsung.com
> Subject: [PATCH v2] pinctrl: samsung: Add support for pull-up and pull-down
> 
> gpiolib framework has the implementation of setting up the PUD
> configuration for GPIO pins but there is no driver support.
> 
> Add support to handle the PUD configuration request from the userspace in
> samsung pinctrl driver.
> 
> Signed-off-by: Vishnu Reddy <vishnu.reddy@samsung.com>
> ---

Reviewed-by: Alim Akhtar <alim.akhtar@samsung.com>



