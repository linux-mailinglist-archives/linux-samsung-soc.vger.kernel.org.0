Return-Path: <linux-samsung-soc+bounces-4131-lists+linux-samsung-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A42E94A82C
	for <lists+linux-samsung-soc@lfdr.de>; Wed,  7 Aug 2024 15:02:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 297A8B22992
	for <lists+linux-samsung-soc@lfdr.de>; Wed,  7 Aug 2024 13:02:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F21E71E6750;
	Wed,  7 Aug 2024 13:01:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="qACwuVz7"
X-Original-To: linux-samsung-soc@vger.kernel.org
Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42FA5155C83
	for <linux-samsung-soc@vger.kernel.org>; Wed,  7 Aug 2024 13:01:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723035716; cv=none; b=sgzlV2Ls+4ypaA1CuG04WCtOAPZ5VIDhTJojKjMS8yQx6YesPQTeD0LUl9RFfsmipQ3+6caKBbZrPO9XE/AdZPOdMZCxjqgPAEcYFmcD8dvypiVDvqCkXKb4GJ6uSrVyouIO8WyY5Nz9IDqCW/FWEgeAvZ3gzZaPiL/Mz/LkuWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723035716; c=relaxed/simple;
	bh=sfzBF71F5p+rccUsNx7UHfsyoGpsuaMUZdjlSWbc3Lw=;
	h=From:To:Cc:In-Reply-To:Subject:Date:Message-ID:MIME-Version:
	 Content-Type:References; b=MW3JMYvJIDkVafmjw1R23WTyFivrrywxQeh4HoXuHBxhszZoPY/xqTy2/Hti/cZdYZzLL6MUQe1t14ZUOZgfqOyiTpPde1o9bi1RtJgWrYTqp+GrNRqR7498g+1HFclw/AtjrbM8WbKq2wEPzdZ5uTG+7u5Sk8AEgXKmT+vJwis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=qACwuVz7; arc=none smtp.client-ip=203.254.224.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from epcas5p2.samsung.com (unknown [182.195.41.40])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20240807130145epoutp02b9c209d1c4cfff630ccfc667dbdca13b~pc9hZT32V1822018220epoutp02l
	for <linux-samsung-soc@vger.kernel.org>; Wed,  7 Aug 2024 13:01:45 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20240807130145epoutp02b9c209d1c4cfff630ccfc667dbdca13b~pc9hZT32V1822018220epoutp02l
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1723035705;
	bh=sfzBF71F5p+rccUsNx7UHfsyoGpsuaMUZdjlSWbc3Lw=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=qACwuVz7snCn/o11bGqEmmVUkZUmwYnaesdkf6z/Hygvo0fLO49lV+Q0NIXoFV65R
	 gr19Fz26r8Bb/KqSwukus4TIQHbg5Yur8A6X0wsfQbhw51fWUCNj81gM1uK3pVwJFs
	 xQzDw/GJOd716puZn1C+kzlokR3vnOs2U8Rec1Aw=
Received: from epsnrtp4.localdomain (unknown [182.195.42.165]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTP id
	20240807130144epcas5p13a6604f40ad0a8732f628dea128cb1ef~pc9guG_Ua2881428814epcas5p1o;
	Wed,  7 Aug 2024 13:01:44 +0000 (GMT)
Received: from epsmges5p3new.samsung.com (unknown [182.195.38.178]) by
	epsnrtp4.localdomain (Postfix) with ESMTP id 4Wf9Ky1Zfnz4x9Pq; Wed,  7 Aug
	2024 13:01:42 +0000 (GMT)
Received: from epcas5p3.samsung.com ( [182.195.41.41]) by
	epsmges5p3new.samsung.com (Symantec Messaging Gateway) with SMTP id
	70.26.09642.53073B66; Wed,  7 Aug 2024 22:01:41 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPA id
	20240807115319epcas5p3c2ee2ad9d5199a91eaaa55610134627a~pcBxZ7fBW2811128111epcas5p3K;
	Wed,  7 Aug 2024 11:53:19 +0000 (GMT)
Received: from epsmgmcp1.samsung.com (unknown [182.195.42.82]) by
	epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20240807115319epsmtrp2baef42fbeeaa87369ef0d326e34b67a9~pcBxZKIYL0267002670epsmtrp2T;
	Wed,  7 Aug 2024 11:53:19 +0000 (GMT)
X-AuditID: b6c32a4b-879fa700000025aa-78-66b37035ee96
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
	epsmgmcp1.samsung.com (Symantec Messaging Gateway) with SMTP id
	80.FF.19367.F2063B66; Wed,  7 Aug 2024 20:53:19 +0900 (KST)
Received: from FDSFTE308 (unknown [107.122.81.79]) by epsmtip2.samsung.com
	(KnoxPortal) with ESMTPA id
	20240807115317epsmtip2ce0730d1a368bac39d42348d3b55a5c0~pcBvSVR8Y0975209752epsmtip2L;
	Wed,  7 Aug 2024 11:53:17 +0000 (GMT)
From: "Aakarsh Jain" <aakarsh.jain@samsung.com>
To: "'Nicolas Dufresne'" <nicolas@ndufresne.ca>,
	<linux-arm-kernel@lists.infradead.org>, <linux-media@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
Cc: <m.szyprowski@samsung.com>, <andrzej.hajda@intel.com>,
	<mchehab@kernel.org>, <hverkuil-cisco@xs4all.nl>,
	<krzysztof.kozlowski+dt@linaro.org>, <linux-samsung-soc@vger.kernel.org>,
	<gost.dev@samsung.com>, <aswani.reddy@samsung.com>,
	<pankaj.dubey@samsung.com>
In-Reply-To: <3765b1674e276afdc302def55327396a0a29cc63.camel@ndufresne.ca>
Subject: RE: [PATCH] media: s5p-mfc: Corrected NV12M/NV21M plane-sizes
Date: Wed, 7 Aug 2024 17:23:15 +0530
Message-ID: <047401dae8c0$65352ec0$2f9f8c40$@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed;
	boundary="----=_NextPart_000_0475_01DAE8EE.7EEEF160"
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQE+FHJLEG7bRbSgl/2Ewycw4h6AZQMC8PEqAYm+p/azMPFrUA==
Content-Language: en-in
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupgl+LIzCtJLcpLzFFi42LZdlhTU9e0YHOaQXe7scX9xZ9ZLA5t3spu
	cfPATiaLizPvslj0vXjIbLHp8TVWi8u75rBZ9GzYymox4/w+Jou1R+6yWyzb9IfJ4tOpncwW
	i7Z+YXfg9Vi85yWTx6ZVnWwed67tYfPYvKTeY/OLbmaPvi2rGD0+b5LzOPX1M3sAR1S2TUZq
	YkpqkUJqXnJ+SmZeuq2Sd3C8c7ypmYGhrqGlhbmSQl5ibqqtkotPgK5bZg7QyUoKZYk5pUCh
	gMTiYiV9O5ui/NKSVIWM/OISW6XUgpScApMCveLE3OLSvHS9vNQSK0MDAyNToMKE7Iz/h++x
	F8xbxVgx/eA29gbG/0sYuxg5OSQETCR+vtrI2sXIxSEksJtRYvmaw0wQzidGiTld/1jhnNVH
	X7PBtDx7NJcRIrGTUaLpegOU85xRYl77aXaQKjYBfYn7p3rA2kUEZjFKdL5cDFbFLNDLJPF2
	+yEmkCpOAS+J96v2gc0VFnCTWHBpAVAHBweLgIpE7z13kDCvgKXEhnnnmCBsQYmTM5+wgNjM
	AqESF3u7mSFOUpD4+XQZK4gtIuAkMbl5AhNEjbjE0Z89zCB7JQT+c0i031nMCtHgInHjcD80
	CIQlXh3fwg5hS0l8frcX6s9kiceLXkItyJFYv2cKC4RtL3HgyhwoW1Zi6ql1UMv4JHp/P2GC
	iPNK7JgHY6tJzLnzA2qvjMTh1Uuh9npI7Fp8gmUCo+IsJL/NQvLbLCQ/QNjaEssWvgayOYBs
	TYn1u/QhwiYSt6ecZoKwFSWmdD9kh7DtJXasX86+gJFjFaNkakFxbnpqsWmBcV5qOTyVJOfn
	bmIEZwMt7x2Mjx580DvEyMTBeIhRBaj90YbVFxilWPLy81KVRHibwzelCfGmJFZWpRblxxeV
	5qQWH2I0BcbVRGYp0eR8YJ7KK4k3NLE0MDEzMzOxNDYzVBLnfd06N0VIID2xJDU7NbUgtQim
	j4mDU6qBSUPj8d6y6sNq1ekq+7i+rk+qWsBwc9/NmIveJpNaxL2fvpH5ruSusPjH0RN3bt7t
	FbWb+myW8pRZq9fUKP3dsmneRG3TPbM4XVu4Nx056uCrpcZ0mc1qQ/9PoW9XuopOS7qFxtxh
	49JdzXvu4ir1/DX7mZW/bLk3k+UCb8HDBTskX332ZBKWm3H7e8+BpPQpupNzMnIaXcuv/+PM
	qb20qW3qWZ/TR7fU805Ysz7u8x2BVR6f49XFMo5blj6oYZm+8kil/aflKfIari+sSlSdd3Wl
	9e2e52roNm11Wazmucavwh91ufjPH3g0g/XwGfGNyycXWH1/+33e9rjd/IW5Ou8EMvovXNfV
	WJ/gv2m14EwlluKMREMt5qLiRABnxsMWmwQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrDIsWRmVeSWpSXmKPExsWy7bCSvK5+wuY0g2PH+SzuL/7MYnFo81Z2
	i5sHdjJZXJx5l8Wi78VDZotNj6+xWlzeNYfNomfDVlaLGef3MVmsPXKX3WLZpj9MFp9O7WS2
	WLT1C7sDr8fiPS+ZPDat6mTzuHNtD5vH5iX1HptfdDN79G1ZxejxeZOcx6mvn9kDOKK4bFJS
	czLLUov07RK4Mg705BXMr6u4vHwiWwPj34QuRk4OCQETiWeP5jJ2MXJxCAlsZ5TY+PsiK0RC
	RuJ/2zF2CFtYYuW/5+wQRU8ZJb52NTKBJNgE9CXun+phBUmICMxhlPg79SjYKGaBqUwSP9t3
	MEO0nGWU+HTpCxtIC6eAl8T7VfvAbGEBN4kFlxYAtXNwsAioSPTecwcJ8wpYSmyYd44JwhaU
	ODnzCQuIzSwQKnGxt5sZ4iQFiZ9Pl4GdKiLgJDG5eQITRI24xNGfPcwTGIVmIWmfhaR9FpIy
	CFtb4unNpyww9rKFr6HiZhK/VjSzYoo7SvT+2sq+gJFjFaNoakFxbnpucoGhXnFibnFpXrpe
	cn7uJkZwpGsF7WBctv6v3iFGJg7GQ4wqQK2PNqy+wCjFkpefl6okwtscvilNiDclsbIqtSg/
	vqg0J7X4EKM0B4uSOK9yTmeKkEB6YklqdmpqQWoRTJaJg1OqgUn+XtES57I6OUHP8gnSv6/X
	/FeLvRETnrF/95L6STvEF22dMyf3hKXywtmV9qFCMcn8f0/oq4eF7p1/TpLz3uf1hoke4U+U
	mZKjPv7cynbOnu8ua8IJFzWBvSmKC5/EOetOeWSbpsWZyV1l6RjsuVx+/1mZ/ZEPpPiWRTis
	jRQJuXbydrWs8FPOo4/52f80madksapXT0gudtq8h+vPQeO3508emMPLb1XD6mD8n7sx+Z7z
	mTmsmUIF3+sUZoYmnMhZIMk9O+yX2ScbZ7FmXY+1CsHLfJi+h4VwzxGRZHoxOXPmkYA+pTk3
	ry+68evBg9oe1dm71gic6koU2lj2N28K0y6vnxdu73pzsn+WmRJLcUaioRZzUXEiAM3UPnRv
	AwAA
X-CMS-MailID: 20240807115319epcas5p3c2ee2ad9d5199a91eaaa55610134627a
X-Msg-Generator: CA
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20240806120911epcas5p1b0defc027a7f03ee9bf5f21036d3ae5e
References: <CGME20240806120911epcas5p1b0defc027a7f03ee9bf5f21036d3ae5e@epcas5p1.samsung.com>
	<20240806115714.29828-1-aakarsh.jain@samsung.com>
	<3765b1674e276afdc302def55327396a0a29cc63.camel@ndufresne.ca>

This is a multipart message in MIME format.

------=_NextPart_000_0475_01DAE8EE.7EEEF160
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Hi Nocolas,

> -----Original Message-----
> From: Nicolas Dufresne <nicolas=40ndufresne.ca>
> Sent: 06 August 2024 20:08
> To: Aakarsh Jain <aakarsh.jain=40samsung.com>; linux-arm-
> kernel=40lists.infradead.org; linux-media=40vger.kernel.org; linux-
> kernel=40vger.kernel.org
> Cc: m.szyprowski=40samsung.com; andrzej.hajda=40intel.com;
> mchehab=40kernel.org; hverkuil-cisco=40xs4all.nl;
> krzysztof.kozlowski+dt=40linaro.org; linux-samsung-soc=40vger.kernel.org;
> gost.dev=40samsung.com; aswani.reddy=40samsung.com;
> pankaj.dubey=40samsung.com
> Subject: Re: =5BPATCH=5D media: s5p-mfc: Corrected NV12M/NV21M plane-size=
s
>=20
> Hi Jain,
>=20
> I haven't dig much, but I have a quick question below.
>=20
> Le mardi 06 ao=C3=BBt=202024=20=C3=A0=2017:27=20+0530,=20Aakarsh=20Jain=
=20a=20=C3=A9crit=20:=0D=0A>=20>=20There=20is=20a=20possibility=20of=20gett=
ing=20page=20fault=20if=20the=20overall=20buffer=0D=0A>=20>=20size=20is=20n=
ot=20aligned=20to=20256bytes.=20Since=20MFC=20does=20read=20operation=20onl=
y=0D=0A>=20>=20and=20it=20won't=20corrupt=20the=20data=20values=20even=20if=
=20it=20reads=20the=20extra=20bytes.=0D=0A>=20>=20Corrected=20luma=20and=20=
chroma=20plane=20sizes=20for=20V4L2_PIX_FMT_NV12M=20and=0D=0A>=20>=20V4L2_P=
IX_FMT_NV21M=20pixel=20format.=0D=0A>=20=0D=0A>=20Have=20you=20re-run=20v4l=
2=20compliance=20?=20(better=20be=20safe=20then=20sorry).=0D=0A>=20=0D=0AI=
=20ran=20v4l2-compliance=20and=20didn't=20found=20any=20issue=20wrt=20to=20=
the=20changes=20added=20in=20this=20patch.=0D=0APlease=20find=20the=20v4l2-=
compliance=20report=20attached.=0D=0A=0D=0A>=20>=0D=0A>=20>=20Signed-off-by=
:=20Aakarsh=20Jain=20<aakarsh.jain=40samsung.com>=0D=0A>=20>=20---=0D=0A>=
=20>=20=20.../media/platform/samsung/s5p-mfc/s5p_mfc_opr_v6.c=20=20=20=20=
=7C=2010=20++++++----=0D=0A>=20>=20=201=20file=20changed,=206=20insertions(=
+),=204=20deletions(-)=0D=0A>=20>=0D=0A>=20>=20diff=20--git=20a/drivers/med=
ia/platform/samsung/s5p-mfc/s5p_mfc_opr_v6.c=0D=0A>=20>=20b/drivers/media/p=
latform/samsung/s5p-mfc/s5p_mfc_opr_v6.c=0D=0A>=20>=20index=2073f7af674c01.=
.03c957221fc4=20100644=0D=0A>=20>=20---=20a/drivers/media/platform/samsung/=
s5p-mfc/s5p_mfc_opr_v6.c=0D=0A>=20>=20+++=20b/drivers/media/platform/samsun=
g/s5p-mfc/s5p_mfc_opr_v6.c=0D=0A>=20>=20=40=40=20-498,8=20+498,8=20=40=40=
=20static=20void=20s5p_mfc_dec_calc_dpb_size_v6(struct=0D=0A>=20s5p_mfc_ctx=
=20*ctx)=0D=0A>=20>=20=20=09case=20V4L2_PIX_FMT_NV21M:=0D=0A>=20>=20=20=09=
=09ctx->stride=5B0=5D=20=3D=20ALIGN(ctx->img_width,=0D=0A>=20S5P_FIMV_NV12M=
T_HALIGN_V6);=0D=0A>=20>=20=20=09=09ctx->stride=5B1=5D=20=3D=20ALIGN(ctx->i=
mg_width,=0D=0A>=20S5P_FIMV_NV12MT_HALIGN_V6);=0D=0A>=20>=20-=09=09ctx->lum=
a_size=20=3D=20calc_plane(ctx->stride=5B0=5D,=20ctx->img_height);=0D=0A>=20=
>=20-=09=09ctx->chroma_size=20=3D=20calc_plane(ctx->stride=5B1=5D,=20(ctx-=
=0D=0A>=20>img_height=20/=202));=0D=0A>=20>=20+=09=09ctx->luma_size=20=3D=
=20calc_plane(ctx->img_width,=20ctx-=0D=0A>=20>img_height);=0D=0A>=20>=20+=
=09=09ctx->chroma_size=20=3D=20calc_plane(ctx->img_width,=20(ctx-=0D=0A>=20=
>img_height=20>>=0D=0A>=20>=20+1));=0D=0A>=20=0D=0A>=20These=20size=20needs=
=20to=20match=20the=20sizes=20reported=20through=20TRY_FMT=20(and=20S_FMT)=
=0D=0A>=20sizeimage=20for=20each=20planes.=20Is=20this=20code=20being=20cal=
l=20withing=20try_fmt=20?=20Will=20these=0D=0A>=20value=20match=20or=20will=
=20this=20change=20cause=20the=20value=20to=20miss-match=20?=0D=0A>=20=0D=
=0AThis=20code=20is=20getting=20called=20within=20try_fmt.=20In=20MFC=20dri=
ver=20we=20are=20not=20returning=20any=20sizes=20in=20TRY_FMT.=20We=20are=
=20only=20validating=20codec=20and=20the=20pixel=20format.=20We=20are=20set=
ting=20luma,=20chroma=20and=20stride=20size=20in=20S_FMT=0D=0Ato=20inform=
=20user=20space=20for=20further=20buffer=20allocation.=20So,=20this=20chang=
e=20is=20not=20going=20to=20cause=20any=20mismatch.=0D=0A=0D=0A>=20The=20re=
ason=20is=20that=20correct=20value=20is=20needed=20for=20allocating=20this=
=20memory=20from=0D=0A>=20the=20outside=20(like=20using=20a=20DMAbuf=20Heap=
).=20Perhaps=20its=20all=20right,=20let=20me=20know.=0D=0A>=20=0D=0A>=20Nic=
olas=0D=0A>=20=0D=0A>=20>=20=20=09=09break;=0D=0A>=20>=20=20=09case=20V4L2_=
PIX_FMT_YUV420M:=0D=0A>=20>=20=20=09case=20V4L2_PIX_FMT_YVU420M:=0D=0A>=20>=
=20=40=40=20-539,9=20+539,11=20=40=40=20static=20void=20s5p_mfc_dec_calc_dp=
b_size_v6(struct=0D=0A>=20>=20s5p_mfc_ctx=20*ctx)=20=20static=20void=20s5p_=
mfc_enc_calc_src_size_v6(struct=0D=0A>=20>=20s5p_mfc_ctx=20*ctx)=20=20=7B=
=0D=0A>=20>=20=20=09unsigned=20int=20mb_width,=20mb_height;=0D=0A>=20>=20+=
=09unsigned=20int=20default_size;=0D=0A>=20>=0D=0A>=20>=20=20=09mb_width=20=
=3D=20MB_WIDTH(ctx->img_width);=0D=0A>=20>=20=20=09mb_height=20=3D=20MB_HEI=
GHT(ctx->img_height);=0D=0A>=20>=20+=09default_size=20=3D=20(mb_width=20*=
=20mb_height)=20*=20256;=0D=0A>=20>=0D=0A>=20>=20=20=09if=20(IS_MFCV12(ctx-=
>dev))=20=7B=0D=0A>=20>=20=20=09=09switch=20(ctx->src_fmt->fourcc)=20=7B=0D=
=0A>=20>=20=40=40=20-549,8=20+551,8=20=40=40=20static=20void=20s5p_mfc_enc_=
calc_src_size_v6(struct=0D=0A>=20s5p_mfc_ctx=20*ctx)=0D=0A>=20>=20=20=09=09=
case=20V4L2_PIX_FMT_NV21M:=0D=0A>=20>=20=20=09=09=09ctx->stride=5B0=5D=20=
=3D=20ALIGN(ctx->img_width,=0D=0A>=20S5P_FIMV_NV12M_HALIGN_V6);=0D=0A>=20>=
=20=20=09=09=09ctx->stride=5B1=5D=20=3D=20ALIGN(ctx->img_width,=0D=0A>=20S5=
P_FIMV_NV12M_HALIGN_V6);=0D=0A>=20>=20-=09=09=09ctx->luma_size=20=3D=20ctx-=
>stride=5B0=5D=20*=20ALIGN(ctx-=0D=0A>=20>img_height,=2016);=0D=0A>=20>=20-=
=09=09=09ctx->chroma_size=20=3D=20=20ctx->stride=5B0=5D=20*=20ALIGN(ctx-=0D=
=0A>=20>img_height=20/=202,=2016);=0D=0A>=20>=20+=09=09=09ctx->luma_size=20=
=3D=20ALIGN(default_size,=20256);=0D=0A>=20>=20+=09=09=09ctx->chroma_size=
=20=3D=20ALIGN(default_size=20/=202,=20256);=0D=0A>=20>=20=20=09=09=09break=
;=0D=0A>=20>=20=20=09=09case=20V4L2_PIX_FMT_YUV420M:=0D=0A>=20>=20=20=09=09=
case=20V4L2_PIX_FMT_YVU420M:=0D=0A=0D=0A
------=_NextPart_000_0475_01DAE8EE.7EEEF160
Content-Type: text/plain; name="v4l2-compliance.txt"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="v4l2-compliance.txt"

IyB2NGwyLWNvbXBsaWFuY2UgLWQgL2Rldi92aWRlbzENCnY0bDItY29tcGxpYW5jZSAxLjIyLjEs
IDY0IGJpdHMsIDY0LWJpdCB0aW1lX3QNCg0KWyAxMDAwLjg0ODQ4Nl0gdmlkaW9jX2dfcGFybToy
MzEyOiBTZXR0aW5nIEZQUyBpcyBvbmx5IHBvc3NpYmxlIGZvciB0aGUgb3V0cHV0IHF1ZXVlDQpb
IDEwMDAuODUyNjA5XSBzNXAtbWZjIDEyODgwMDAwLm1mYzogRW5jb2Rpbmcgbm90IGluaXRpYWxp
c2VkDQpbIDEwMDAuODU3MTgxXSBzNXAtbWZjIDEyODgwMDAwLm1mYzogRW5jb2Rpbmcgbm90IGlu
aXRpYWxpc2VkDQpbIDEwMDAuODYyNzk0XSB2aWRpb2NfZ19wYXJtOjIzMTI6IFNldHRpbmcgRlBT
IGlzIG9ubHkgcG9zc2libGUgZm9yIHRoZSBvdXRwdXQgcXVldWUNClsgMTAwMC44NzAxMjBdIHZp
ZGlvY190cnlfZm10OjE0NDA6IGZhaWxlZCB0byB0cnkgb3V0cHV0IGZvcm1hdA0KQ29tcGxpYW5j
ZSB0ZXN0IGZvciBzNXAtbWZjIGRldmljZSAvZGV2L3ZpZGVvMToNCg0KRHJpdmVyIEluZm86DQog
ICAgICAgIERyaXZlciBuYW1lICAgICAgOiBzNXAtbWZjDQogICAgICAgIENhcmQgdHlwZSAgICAg
ICAgOiBzNXAtbWZjLWVuYw0KICAgICAgICBCdXMgaW5mbyAgICAgICAgIDogcGxhdGZvcm06MTI4
ODAwMDAubWZjDQogICAgICAgIERyaXZlciB2ZXJzaW9uICAgOiA2LjEwLjANCiAgICAgICAgQ2Fw
YWJpbGl0aWVzICAgICA6IDB4ODQyMDQwMDANCiAgICAgICAgICAgICAgICBWaWRlbyBNZW1vcnkt
dG8tTWVtb3J5IE11bHRpcGxhbmFyDQogICAgICAgICAgICAgICAgU3RyZWFtaW5nDQogICAgICAg
ICAgICAgICAgRXh0ZW5kZWQgUGl4IEZvcm1hdA0KICAgICAgICAgICAgICAgIERldmljZSBDYXBh
YmlsaXRpZXMNCiAgICAgICAgRGV2aWNlIENhcHMgICAgICA6IDB4MDQyMDQwMDANCiAgICAgICAg
ICAgICAgICBWaWRlbyBNZW1vcnktdG8tTWVtb3J5IE11bHRpcGxhbmFyDQogICAgICAgICAgICAg
ICAgU3RyZWFtaW5nDQogICAgICAgICAgICAgICAgRXh0ZW5kZWQgUGl4IEZvcm1hdA0KICAgICAg
ICBEZXRlY3RlZCBTdGF0ZWZ1bCBFbmNvZGVyDQoNClJlcXVpcmVkIGlvY3RsczoNCiAgICAgICAg
dGVzdCBWSURJT0NfUVVFUllDQVA6IE9LDQogICAgICAgIHRlc3QgaW52YWxpZCBpb2N0bHM6IE9L
DQoNCkFsbG93IGZvciBtdWx0aXBsZSBvcGVuczoNCiAgICAgICAgdGVzdCBzZWNvbmQgL2Rldi92
aWRlbzEgb3BlbjogT0sNCiAgICAgICAgdGVzdCBWSURJT0NfUVVFUllDQVA6IE9LDQogICAgICAg
IHRlc3QgVklESU9DX0cvU19QUklPUklUWTogT0sNCiAgICAgICAgICAgICAgICBmYWlsOiB2NGwy
LWNvbXBsaWFuY2UuY3BwKDczNik6ICFvaw0KICAgICAgICB0ZXN0IGZvciB1bmxpbWl0ZWQgb3Bl
bnM6IEZBSUwNCg0KRGVidWcgaW9jdGxzOg0KICAgICAgICB0ZXN0IFZJRElPQ19EQkdfRy9TX1JF
R0lTVEVSOiBPSyAoTm90IFN1cHBvcnRlZCkNCiAgICAgICAgdGVzdCBWSURJT0NfTE9HX1NUQVRV
UzogT0sgKE5vdCBTdXBwb3J0ZWQpDQoNCklucHV0IGlvY3RsczoNCiAgICAgICAgdGVzdCBWSURJ
T0NfRy9TX1RVTkVSL0VOVU1fRlJFUV9CQU5EUzogT0sgKE5vdCBTdXBwb3J0ZWQpDQogICAgICAg
IHRlc3QgVklESU9DX0cvU19GUkVRVUVOQ1k6IE9LIChOb3QgU3VwcG9ydGVkKQ0KICAgICAgICB0
ZXN0IFZJRElPQ19TX0hXX0ZSRVFfU0VFSzogT0sgKE5vdCBTdXBwb3J0ZWQpDQogICAgICAgIHRl
c3QgVklESU9DX0VOVU1BVURJTzogT0sgKE5vdCBTdXBwb3J0ZWQpDQogICAgICAgIHRlc3QgVklE
SU9DX0cvUy9FTlVNSU5QVVQ6IE9LIChOb3QgU3VwcG9ydGVkKQ0KICAgICAgICB0ZXN0IFZJRElP
Q19HL1NfQVVESU86IE9LIChOb3QgU3VwcG9ydGVkKQ0KICAgICAgICBJbnB1dHM6IDAgQXVkaW8g
SW5wdXRzOiAwIFR1bmVyczogMA0KDQpPdXRwdXQgaW9jdGxzOg0KICAgICAgICB0ZXN0IFZJRElP
Q19HL1NfTU9EVUxBVE9SOiBPSyAoTm90IFN1cHBvcnRlZCkNCiAgICAgICAgdGVzdCBWSURJT0Nf
Ry9TX0ZSRVFVRU5DWTogT0sgKE5vdCBTdXBwb3J0ZWQpDQogICAgICAgIHRlc3QgVklESU9DX0VO
VU1BVURPVVQ6IE9LIChOb3QgU3VwcG9ydGVkKQ0KICAgICAgICB0ZXN0IFZJRElPQ19HL1MvRU5V
TU9VVFBVVDogT0sgKE5vdCBTdXBwb3J0ZWQpDQogICAgICAgIHRlc3QgVklESU9DX0cvU19BVURP
VVQ6IE9LIChOb3QgU3VwcG9ydGVkKQ0KICAgICAgICBPdXRwdXRzOiAwIEF1ZGlvIE91dHB1dHM6
IDAgTW9kdWxhdG9yczogMA0KDQpJbnB1dC9PdXRwdXQgY29uZmlndXJhdGlvbiBpb2N0bHM6DQog
ICAgICAgIHRlc3QgVklESU9DX0VOVU0vRy9TL1FVRVJZX1NURDogT0sgKE5vdCBTdXBwb3J0ZWQp
DQogICAgICAgIHRlc3QgVklESU9DX0VOVU0vRy9TL1FVRVJZX0RWX1RJTUlOR1M6IE9LIChOb3Qg
U3VwcG9ydGVkKQ0KICAgICAgICB0ZXN0IFZJRElPQ19EVl9USU1JTkdTX0NBUDogT0sgKE5vdCBT
dXBwb3J0ZWQpDQogICAgICAgIHRlc3QgVklESU9DX0cvU19FRElEOiBPSyAoTm90IFN1cHBvcnRl
ZCkNCg0KQ29udHJvbCBpb2N0bHM6DQogICAgICAgIHRlc3QgVklESU9DX1FVRVJZX0VYVF9DVFJM
L1FVRVJZTUVOVTogT0sNCiAgICAgICAgdGVzdCBWSURJT0NfUVVFUllDVFJMOiBPSw0KICAgICAg
ICAgICAgICAgIGZhaWw6IHY0bDItdGVzdC1jb250cm9scy5jcHAoNDczKTogZ19jdHJsIHJldHVy
bmVkIGFuIGVycm9yICgyMikNCiAgICAgICAgdGVzdCBWSURJT0NfRy9TX0NUUkw6IEZBSUwNCiAg
ICAgICAgICAgICAgICBmYWlsOiB2NGwyLXRlc3QtY29udHJvbHMuY3BwKDcwNCk6IGdfZXh0X2N0
cmxzIHJldHVybmVkIGFuIGVycm9yICgyMikNCiAgICAgICAgdGVzdCBWSURJT0NfRy9TL1RSWV9F
WFRfQ1RSTFM6IEZBSUwNCiAgICAgICAgICAgICAgICBmYWlsOiB2NGwyLXRlc3QtY29udHJvbHMu
Y3BwKDg3Mik6IHN1YnNjcmliZSBldmVudCBmb3IgY29udHJvbCAnVXNlciBDb250cm9scycgZmFp
bGVkDQogICAgICAgIHRlc3QgVklESU9DXyhVTilTVUJTQ1JJQkVfRVZFTlQvRFFFVkVOVDogRkFJ
TA0KICAgICAgICB0ZXN0IFZJRElPQ19HL1NfSlBFR0NPTVA6IE9LIChOb3QgU3VwcG9ydGVkKQ0K
ICAgICAgICBTdGFuZGFyZCBDb250cm9sczogMTA3IFByaXZhdGUgQ29udHJvbHM6IDExDQoNCkZv
cm1hdCBpb2N0bHM6DQogICAgICAgICAgICAgICAgZmFpbDogdjRsMi10ZXN0LWZvcm1hdHMuY3Bw
KDI4Mik6IG5vZGUtPmNvZGVjX21hc2sgJiBTVEFURUZVTF9FTkNPREVSDQogICAgICAgIHRlc3Qg
VklESU9DX0VOVU1fRk1UL0ZSQU1FU0laRVMvRlJBTUVJTlRFUlZBTFM6IEZBSUwNCiAgICAgICAg
ICAgICAgICBmYWlsOiB2NGwyLXRlc3QtZm9ybWF0cy5jcHAoMTMxMCk6IGlzX3N0YXRlZnVsX2Vu
YyAmJiAhb3V0LT5jYXBhYmlsaXR5DQogICAgICAgIHRlc3QgVklESU9DX0cvU19QQVJNOiBGQUlM
DQogICAgICAgIHRlc3QgVklESU9DX0dfRkJVRjogT0sgKE5vdCBTdXBwb3J0ZWQpDQogICAgICAg
ICAgICAgICAgZmFpbDogdjRsMi10ZXN0LWZvcm1hdHMuY3BwKDQ3NCk6ICFwaXhfbXAud2lkdGgg
fHwgIXBpeF9tcC5oZWlnaHQNCiAgICAgICAgdGVzdCBWSURJT0NfR19GTVQ6IEZBSUwNCiAgICAg
ICAgICAgICAgICBmYWlsOiB2NGwyLXRlc3QtZm9ybWF0cy5jcHAoNDc0KTogIXBpeF9tcC53aWR0
aCB8fCAhcGl4X21wLmhlaWdodA0KICAgICAgICB0ZXN0IFZJRElPQ19UUllfRk1UOiBGQUlMDQog
ICAgICAgICAgICAgICAgd2FybjogdjRsMi10ZXN0LWZvcm1hdHMuY3BwKDExNDcpOiBTX0ZNVCBj
YW5ub3QgaGFuZGxlIGFuIGludmFsaWQgcGl4ZWxmb3JtYXQuDQogICAgICAgICAgICAgICAgd2Fy
bjogdjRsMi10ZXN0LWZvcm1hdHMuY3BwKDExNDgpOiBUaGlzIG1heSBvciBtYXkgbm90IGJlIGEg
cHJvYmxlbS4gRm9yIG1vcmUgaW5mb3JtYXRpb24gc2VlOg0KICAgICAgICAgICAgICAgIHdhcm46
IHY0bDItdGVzdC1mb3JtYXRzLmNwcCgxMTQ5KTogaHR0cDovL3d3dy5tYWlsLWFyY2hpdmUuY29t
L2xpbnV4LW1lZGlhQHZnZXIua2VybmVsLm9yZy9tc2c1NjU1MC5odG1sDQogICAgICAgICAgICAg
ICAgZmFpbDogdjRsMi10ZXN0LWZvcm1hdHMuY3BwKDQ3OCk6IHBpeGVsZm9ybWF0IDM0MzYzMjQ4
IChIMjY0KSBmb3IgYnVmdHlwZSA5IG5vdCByZXBvcnRlZCBieSBFTlVNX0ZNVA0KICAgICAgICB0
ZXN0IFZJRElPQ19TX0ZNVDogRkFJTA0KICAgICAgICB0ZXN0IFZJRElPQ19HX1NMSUNFRF9WQklf
Q0FQOiBPSyAoTm90IFN1cHBvcnRlZCkNCiAgICAgICAgdGVzdCBDcm9wcGluZzogT0sgKE5vdCBT
dXBwb3J0ZWQpDQogICAgICAgIHRlc3QgQ29tcG9zaW5nOiBPSyAoTm90IFN1cHBvcnRlZCkNCiAg
ICAgICAgdGVzdCBTY2FsaW5nOiBPSyAoTm90IFN1cHBvcnRlZCkNCg0KQ29kZWMgaW9jdGxzOg0K
ICAgICAgICAgICAgICAgIGZhaWw6IHY0bDItdGVzdC1jb2RlY3MuY3BwKDM1KTogbm9kZS0+ZnVu
Y3Rpb25bIDEwMDEuMjEzMzE0XSBzNXBfbWZjX3F1ZXVlX3NldHVwOjI0MjY6IGludmFsaWQgc3Rh
dGU6IDANClsgMTAwMS4yMTc0NDldIHZpZGlvY19yZXFidWZzOjE1NTg6IGVycm9yIGluIHZiMl9y
ZXFidWZzKCkgZm9yIEUoRCkNClsgMTAwMS4yMjM2MDBdIHZpZGlvY19nX3Bhcm06MjMxMjogU2V0
dGluZyBGUFMgaXMgb25seSBwb3NzaWJsZSBmb3IgdGhlIG91dHB1dCBxdWV1ZQ0KICE9IE1FRElB
X0VOVF9GX1BST0NfVklERU9fRU5DT0RFUg0KICAgICAgICB0ZXN0IFZJRElPQ18oVFJZXylFTkNP
REVSX0NNRDogRkFJTA0KICAgICAgICB0ZXN0IFZJRElPQ19HX0VOQ19JTkRFWDogT0sgKE5vdCBT
dXBwb3J0ZWQpDQogICAgICAgIHRlc3QgVklESU9DXyhUUllfKURFQ09ERVJfQ01EOiBPSyAoTm90
IFN1cHBvcnRlZCkNCg0KQnVmZmVyIGlvY3RsczoNCiAgICAgICAgICAgICAgICBmYWlsOiB2NGwy
LXRlc3QtYnVmZmVycy5jcHAoNjA3KTogcS5yZXFidWZzKG5vZGUsIDEpDQogICAgICAgIHRlc3Qg
VklESU9DX1JFUUJVRlMvQ1JFQVRFX0JVRlMvUVVFUllCVUY6IEZBSUwNCiAgICAgICAgICAgICAg
ICBmYWlsOiB2NGwyLXRlc3QtYnVmZmVycy5jcHAoNzgzKTogVklESU9DX0VYUEJVRiBpcyBzdXBw
b3J0ZWQsIGJ1dCB0aGUgVjRMMl9NRU1PUllfTU1BUCBzdXBwb3J0IGlzIG1pc3Npbmcgb3IgbWFs
ZnVuY3Rpb25pbmcuDQogICAgICAgICAgICAgICAgZmFpbDogdjRsMi10ZXN0LWJ1ZmZlcnMuY3Bw
KDc4NCk6IFZJRElPQ19FWFBCVUYgaXMgc3VwcG9ydGVkLCBidXQgdGhlIFY0TDJfTUVNT1JZX01N
QVAgc3VwcG9ydCBpcyBtaXNzaW5nLCBwcm9iYWJseSBkdWUgdG8gZWFybGllciBmYWlsaW5nIGZv
cm1hdCB0ZXN0cy4NCiAgICAgICAgdGVzdCBWSURJT0NfRVhQQlVGOiBPSyAoTm90IFN1cHBvcnRl
ZCkNCiAgICAgICAgdGVzdCBSZXF1ZXN0czogT0sgKE5vdCBTdXBwb3J0ZWQpDQoNClRvdGFsIGZv
ciBzNXAtbWZjIGRldmljZSAvZGV2L3ZpZGVvMTogNDUsIFN1Y2NlZWRlZDogMzQsIEZhaWxlZDog
MTEsIFdhcm5pbmdzOiAzDQojDQojIHY0bDItY29tcGxpYW5jZSAtZCAvZGV2L3ZpZGVvMA0KIyB2
NGwyLWNvbXBsaWFuY2UgLWQgL2Rldi92aWRlbzANCnY0bDItY29tcGxpYW5jZSAxLjIyLjEsIDY0
IGJpdHMsIDY0LWJpdCB0aW1lX3QNCg0KWyAxODY3LjY0MDgxOF0gdmlkaW9jX2dfc2VsZWN0aW9u
OjgxNjogQ2FuIG5vdCBnZXQgY29tcG9zZSBpbmZvcm1hdGlvbg0KWyAxODY3LjY0NDQzMl0gdmlk
aW9jX2dfc2VsZWN0aW9uOjgxNjogQ2FuIG5vdCBnZXQgY29tcG9zZSBpbmZvcm1hdGlvbg0KWyAx
ODY3LjY1MDI2NV0gdmlkaW9jX2dfZm10OjM5NzogRm9ybWF0IGNvdWxkIG5vdCBiZSByZWFkDQpb
IDE4NjcuNjU1MzAxXSB2aWRpb2NfZ19zZWxlY3Rpb246ODE2OiBDYW4gbm90IGdldCBjb21wb3Nl
IGluZm9ybWF0aW9uDQpbIDE4NjcuNjYxNTExXSB2aWRpb2NfZ19zZWxlY3Rpb246ODE2OiBDYW4g
bm90IGdldCBjb21wb3NlIGluZm9ybWF0aW9uDQpbIDE4NjcuNjY4MjExXSBzNXAtbWZjIDEyODgw
MDAwLm1mYzogRGVjb2Rpbmcgbm90IGluaXRpYWxpc2VkDQpbIDE4NjcuNjczMjM1XSBzNXAtbWZj
IDEyODgwMDAwLm1mYzogRGVjb2Rpbmcgbm90IGluaXRpYWxpc2VkDQpbIDE4NjcuNjc4ODk0XSB2
aWRpb2NfZ19mbXQ6Mzk3OiBGb3JtYXQgY291bGQgbm90IGJlIHJlYWQNClsgMTg2Ny42ODM4MTFd
IHZpZGlvY19nX3NlbGVjdGlvbjo4MTY6IENhbiBub3QgZ2V0IGNvbXBvc2UgaW5mb3JtYXRpb24N
ClsgMTg2Ny42OTAwNjhdIHZpZGlvY19nX3NlbGVjdGlvbjo4MTY6IENhbiBub3QgZ2V0IGNvbXBv
c2UgaW5mb3JtYXRpb24NClsgMTg2Ny42OTYyNDZdIHZpZGlvY19nX3NlbGVjdGlvbjo4MTY6IENh
biBub3QgZ2V0IGNvbXBvc2UgaW5mb3JtYXRpb24NClsgMTg2Ny43MDI1MzNdIHZpZGlvY19nX3Nl
bGVjdGlvbjo4MTY6IENhbiBub3QgZ2V0IGNvbXBvc2UgaW5mb3JtYXRpb24NClsgMTg2Ny43MDg3
MzFdIHZpZGlvY19nX3NlbGVjdGlvbjo4MTY6IENhbiBub3QgZ2V0IGNvbXBvc2UgaW5mb3JtYXRp
b24NClsgMTg2Ny43MTUwNDRdIHZpZGlvY19nX3NlbGVjdGlvbjo4MTY6IENhbiBub3QgZ2V0IGNv
bXBvc2UgaW5mb3JtYXRpb24NClsgMTg2Ny43MjE0MTJdIHZpZGlvY19nX3NlbGVjdGlvbjo4MTY6
IENhbiBub3QgZ2V0IGNvbXBvc2UgaW5mb3JtYXRpb24NClsgMTg2Ny43Mjc2NjBdIHZpZGlvY19n
X3NlbGVjdGlvbjo4MTY6IENhbiBub3QgZ2V0IGNvbXBvc2UgaW5mb3JtYXRpb24NClsgMTg2Ny43
MzM4MDldIHZpZGlvY19nX3NlbGVjdGlvbjo4MTY6IENhbiBub3QgZ2V0IGNvbXBvc2UgaW5mb3Jt
YXRpb24NClsgMTg2Ny43NDAxNDVdIHZpZGlvY19nX3NlbGVjdGlvbjo4MTY6IENhbiBub3QgZ2V0
IGNvbXBvc2UgaW5mb3JtYXRpb24NClsgMTg2Ny43NDYxNzJdIHZpZGlvY190cnlfZm10OjQyOTog
VW5zdXBwb3J0ZWQgZm9ybWF0IGZvciBkZXN0aW5hdGlvbi4NClsgMTg2Ny43NTI1NzldIHZpZGlv
Y19nX3NlbGVjdGlvbjo4MTY6IENhbiBub3QgZ2V0IGNvbXBvc2UgaW5mb3JtYXRpb24NClsgMTg2
Ny43NTg2ODhdIHZpZGlvY19nX3NlbGVjdGlvbjo4MTY6IENhbiBub3QgZ2V0IGNvbXBvc2UgaW5m
b3JtYXRpb24NClsgMTg2Ny43NjQ5MzhdIHZpZGlvY190cnlfZm10OjQyOTogVW5zdXBwb3J0ZWQg
Zm9ybWF0IGZvciBkZXN0aW5hdGlvbi4NClsgMTg2Ny43NzEyNjFdIHZpZGlvY19nX3NlbGVjdGlv
bjo4MTY6IENhbiBub3QgZ2V0IGNvbXBvc2UgaW5mb3JtYXRpb24NCkNvbXBsaWFuY2UgdGVzdCBm
b3IgczVwLW1mYyBkZXZpY2UgL2Rldi92aWRlbzA6DQoNCkRyaXZlciBJbmZvOg0KICAgICAgICBE
cml2ZXIgbmFtZSAgICAgIDogczVwLW1mYw0KICAgICAgICBDYXJkIHR5cGUgICAgICAgIDogczVw
LW1mYy1kZWMNCiAgICAgICAgQnVzIGluZm8gICAgICAgICA6IHBsYXRmb3JtOjEyODgwMDAwLm1m
Yw0KICAgICAgICBEcml2ZXIgdmVyc2lvbiAgIDogNi4xMC4wDQogICAgICAgIENhcGFiaWxpdGll
cyAgICAgOiAweDg0MjA0MDAwDQogICAgICAgICAgICAgICAgVmlkZW8gTWVtb3J5LXRvLU1lbW9y
eSBNdWx0aXBsYW5hcg0KICAgICAgICAgICAgICAgIFN0cmVhbWluZw0KICAgICAgICAgICAgICAg
IEV4dGVuZGVkIFBpeCBGb3JtYXQNCiAgICAgICAgICAgICAgICBEZXZpY2UgQ2FwYWJpbGl0aWVz
DQogICAgICAgIERldmljZSBDYXBzICAgICAgOiAweDA0MjA0MDAwDQogICAgICAgICAgICAgICAg
VmlkZW8gTWVtb3J5LXRvLU1lbW9yeSBNdWx0aXBsYW5hcg0KICAgICAgICAgICAgICAgIFN0cmVh
bWluZw0KICAgICAgICAgICAgICAgIEV4dGVuZGVkIFBpeCBGb3JtYXQNCiAgICAgICAgRGV0ZWN0
ZWQgU3RhdGVmdWwgRGVjb2Rlcg0KDQpSZXF1aXJlZCBpb2N0bHM6DQogICAgICAgIHRlc3QgVklE
SU9DX1FVRVJZQ0FQOiBPSw0KICAgICAgICB0ZXN0IGludmFsaWQgaW9jdGxzOiBPSw0KDQpBbGxv
dyBmb3IgbXVsdGlwbGUgb3BlbnM6DQogICAgICAgIHRlc3Qgc2Vjb25kIC9kZXYvdmlkZW8wIG9w
ZW46IE9LDQogICAgICAgIHRlc3QgVklESU9DX1FVRVJZQ0FQOiBPSw0KICAgICAgICB0ZXN0IFZJ
RElPQ19HL1NfUFJJT1JJVFk6IE9LDQogICAgICAgICAgICAgICAgZmFpbDogdjRsMi1jb21wbGlh
bmNlLmNwcCg3MzYpOiAhb2sNCiAgICAgICAgdGVzdCBmb3IgdW5saW1pdGVkIG9wZW5zOiBGQUlM
DQoNCkRlYnVnIGlvY3RsczoNCiAgICAgICAgdGVzdCBWSURJT0NfREJHX0cvU19SRUdJU1RFUjog
T0sgKE5vdCBTdXBwb3J0ZWQpDQogICAgICAgIHRlc3QgVklESU9DX0xPR19TVEFUVVM6IE9LIChO
b3QgU3VwcG9ydGVkKQ0KDQpJbnB1dCBpb2N0bHM6DQogICAgICAgIHRlc3QgVklESU9DX0cvU19U
VU5FUi9FTlVNX0ZSRVFfQkFORFM6IE9LIChOb3QgU3VwcG9ydGVkKQ0KICAgICAgICB0ZXN0IFZJ
RElPQ19HL1NfRlJFUVVFTkNZOiBPSyAoTm90IFN1cHBvcnRlZCkNCiAgICAgICAgdGVzdCBWSURJ
T0NfU19IV19GUkVRX1NFRUs6IE9LIChOb3QgU3VwcG9ydGVkKQ0KICAgICAgICB0ZXN0IFZJRElP
Q19FTlVNQVVESU86IE9LIChOb3QgU3VwcG9ydGVkKQ0KICAgICAgICB0ZXN0IFZJRElPQ19HL1Mv
RU5VTUlOUFVUOiBPSyAoTm90IFN1cHBvcnRlZCkNCiAgICAgICAgdGVzdCBWSURJT0NfRy9TX0FV
RElPOiBPSyAoTm90IFN1cHBvcnRlZCkNCiAgICAgICAgSW5wdXRzOiAwIEF1ZGlvIElucHV0czog
MCBUdW5lcnM6IDANCg0KT3V0cHV0IGlvY3RsczoNCiAgICAgICAgdGVzdCBWSURJT0NfRy9TX01P
RFVMQVRPUjogT0sgKE5vdCBTdXBwb3J0ZWQpDQogICAgICAgIHRlc3QgVklESU9DX0cvU19GUkVR
VUVOQ1k6IE9LIChOb3QgU3VwcG9ydGVkKQ0KICAgICAgICB0ZXN0IFZJRElPQ19FTlVNQVVET1VU
OiBPSyAoTm90IFN1cHBvcnRlZCkNCiAgICAgICAgdGVzdCBWSURJT0NfRy9TL0VOVU1PVVRQVVQ6
IE9LIChOb3QgU3VwcG9ydGVkKQ0KICAgICAgICB0ZXN0IFZJRElPQ19HL1NfQVVET1VUOiBPSyAo
Tm90IFN1cHBvcnRlZCkNCiAgICAgICAgT3V0cHV0czogMCBBdWRpbyBPdXRwdXRzOiAwIE1vZHVs
YXRvcnM6IDANCg0KSW5wdXQvT3V0cHV0IGNvbmZpZ3VyYXRpb24gaW9jdGxzOg0KICAgICAgICB0
ZXN0IFZJRElPQ19FTlVNL0cvUy9RVUVSWV9TVEQ6IE9LIChOb3QgU3VwcG9ydGVkKQ0KICAgICAg
ICB0ZXN0IFZJRElPQ19FTlVNL0cvUy9RVUVSWV9EVl9USU1JTkdTOiBPSyAoTm90IFN1cHBvcnRl
ZCkNCiAgICAgICAgdGVzdCBWSURJT0NfRFZfVElNSU5HU19DQVA6IE9LIChOb3QgU3VwcG9ydGVk
KQ0KICAgICAgICB0ZXN0IFZJRElPQ19HL1NfRURJRDogT0sgKE5vdCBTdXBwb3J0ZWQpDQoNCkNv
bnRyb2wgaW9jdGxzOg0KICAgICAgICB0ZXN0IFZJRElPQ19RVUVSWV9FWFRfQ1RSTC9RVUVSWU1F
TlU6IE9LDQogICAgICAgIHRlc3QgVklESU9DX1FVRVJZQ1RSTDogT0sNCiAgICAgICAgICAgICAg
ICBmYWlsOiB2NGwyLXRlc3QtY29udHJvbHMuY3BwKDQ3Myk6IGdfY3RybCByZXR1cm5lZCBhbiBl
cnJvciAoMjIpDQogICAgICAgIHRlc3QgVklESU9DX0cvU19DVFJMOiBGQUlMDQogICAgICAgICAg
ICAgICAgZmFpbDogdjRsMi10ZXN0LWNvbnRyb2xzLmNwcCg3MDQpOiBnX2V4dF9jdHJscyByZXR1
cm5lZCBhbiBlcnJvciAoMjIpDQogICAgICAgIHRlc3QgVklESU9DX0cvUy9UUllfRVhUX0NUUkxT
OiBGQUlMDQogICAgICAgICAgICAgICAgZmFpbDogdjRsMi10ZXN0LWNvbnRyb2xzLmNwcCg4NzIp
OiBzdWJzY3JpYmUgZXZlbnQgZm9yIGNvbnRyb2wgJ1VzZXIgQ29udHJvbHMnIGZhaWxlZA0KICAg
ICAgICB0ZXN0IFZJRElPQ18oVU4pU1VCU0NSSUJFX0VWRU5UL0RRRVZFTlQ6IEZBSUwNCiAgICAg
ICAgdGVzdCBWSURJT0NfRy9TX0pQRUdDT01QOiBPSyAoTm90IFN1cHBvcnRlZCkNCiAgICAgICAg
U3RhbmRhcmQgQ29udHJvbHM6IDcgUHJpdmF0ZSBDb250cm9sczogMg0KDQpGb3JtYXQgaW9jdGxz
Og0KICAgICAgICAgICAgICAgIGZhaWw6IHY0bDItdGVzdC1mb3JtYXRzLmNwcCgyNjMpOiBmbXRk
ZXNjLmRlc2NyaXB0aW9uIG1pc21hdGNoOiB3YXMgJ1kvVVYgNDoyOjAgKE4tQyknLCBleHBlY3Rl
ZCAnWS9DYkNyIDQ6MjowIChOLUMpJw0KICAgICAgICB0ZXN0IFZJRElPQ19FTlVNX0ZNVC9GUkFN
RVNJWkVTL0ZSQU1FSU5URVJWQUxTOiBGQUlMDQogICAgICAgIHRlc3QgVklESU9DX0cvU19QQVJN
OiBPSyAoTm90IFN1cHBvcnRlZCkNCiAgICAgICAgdGVzdCBWSURJT0NfR19GQlVGOiBPSyAoTm90
IFN1cHBvcnRlZCkNCiAgICAgICAgICAgICAgICBmYWlsOiB2NGwyLXRlc3QtZm9ybWF0cy5jcHAo
NjIwKTogVmlkZW8gQ2FwdHVyZSBNdWx0aXBsYW5hciBjYXAgc2V0LCBidXQgbm8gVmlkZW8gQ2Fw
dHVyZSBNdWx0aXBsYW5hciBmb3JtYXRzIGRlZmluZWQNCiAgICAgICAgdGVzdCBWSURJT0NfR19G
TVQ6IEZBSUwNCiAgICAgICAgdGVzdCBWSURJT0NfVFJZX0ZNVDogT0sgKE5vdCBTdXBwb3J0ZWQp
DQogICAgICAgIHRlc3QgVklESU9DX1NfRk1UOiBPSyAoTm90IFN1cHBvcnRlZCkNCiAgICAgICAg
dGVzdCBWSURJT0NfR19TTElDRURfVkJJX0NBUDogT0sgKE5vdCBTdXBwb3J0ZWQpDQogICAgICAg
IHRlc3QgQ3JvcHBpbmc6IE9LIChOb3QgU3VwcG9ydGVkKQ0KICAgICAgICB0ZXN0IENvbXBvc2lu
ZzogT0sgKE5vdCBTdXBwb3J0ZWQpDQogICAgICAgIHRlc3QgU2NhbGluZzogT0sgKE5vdCBTdXBw
b3J0ZWQpDQoNCkNvZGVjIGlvY3RsczoNCiAgICAgICAgdGVzdCBWSURJT0NfKFRSWV8pRU5DT0RF
Ul9DTUQ6IE9LIChOb3QgU3VwcG9ydGVkKQ0KICAgICAgICB0ZXN0IFZJRElPQ19HX0VOQ19JTkRF
WDogT0sgKE5vdCBTdXBwb3J0ZWQpDQogICAgICAgICAgICAgICAgZmFpbDogdjRsMi10ZXN0LWNv
ZGVjcy5jcHAoMTA0KTogbm9kZS0+ZnVuY3Rpb24gIT0gTUVESUFfRU5UX0ZfUFJPQ19WSURFT19E
RUNPREVSDQogICAgICAgIHRlc3QgVklESU9DXyhUUllfKURFQ09ERVJfQ01EOiBGQUlMDQoNCkJ1
ZmZlciBpb2N0bHM6DQogICAgICAgIHRlc3QgVklESU9DX1JFUUJVRlMvQ1JFQVRFX0JVRlMvUVVF
UllCVUY6IE9LDQogICAgICAgIHRlc3QgVklESU9DX0VYUEJVRjogT0sgKE5vdCBTdXBwb3J0ZWQp
DQogICAgICAgIHRlc3QgUmVxdWVzdHM6IE9LIChOb3QgU3VwcG9ydGVkKQ0KDQpUb3RhbCBmb3Ig
czVwLW1mYyBkZXZpY2UgL2Rldi92aWRlbzA6IDQ1LCBTdWNjZWVkZWQ6IDM4LCBGYWlsZWQ6IDcs
IFdhcm5pbmdzOiAwDQo=

------=_NextPart_000_0475_01DAE8EE.7EEEF160--


