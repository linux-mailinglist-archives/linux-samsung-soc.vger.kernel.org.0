Return-Path: <linux-samsung-soc+bounces-10416-lists+linux-samsung-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6144FB3776F
	for <lists+linux-samsung-soc@lfdr.de>; Wed, 27 Aug 2025 03:51:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0C3E47C7DBF
	for <lists+linux-samsung-soc@lfdr.de>; Wed, 27 Aug 2025 01:51:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E65F31E51EC;
	Wed, 27 Aug 2025 01:50:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RtohOwq/"
X-Original-To: linux-samsung-soc@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1A3E1DDA24
	for <linux-samsung-soc@vger.kernel.org>; Wed, 27 Aug 2025 01:50:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756259452; cv=none; b=RcCIDe/xPqHgGI4uKtyS5rzCmWlQCf23iYZTZiW6gL48G9K5nm/yGKO1j4zrLxYsBa6jtUvh5uWekgwQm9Jx+emp4C6frS5h5tZ4yCAoW0XzDp6dJguMWhR+atrG3i9/YbIpDcUgztjcTxKkot3rcj98EdGVGSUp5DbJt9F0o28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756259452; c=relaxed/simple;
	bh=HZCUzkkrDtoFfybmi/wQUgDLYhcZj2oCbu0jLkMK5WA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nlhl+wpDKntBU28I+tR24ELp3sS/OtmZo+ypwmHQy4egXZFMWaGeFzVDIbqh/jaBt5gGRqPRyZJ4yZ+YD2ur2h6toBByS4hvSBpHm8z+0KwLXpNL95S3KsP1l2jFoqaEXXy2Jc+uWiBP0S5ooAv5SU902oi0As5LxNxiENQrVSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RtohOwq/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57QN20C7031496
	for <linux-samsung-soc@vger.kernel.org>; Wed, 27 Aug 2025 01:50:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=0laXQCaNkR8BdkTEIAIjvxkP
	U6e+xAcI3sMZOZG++40=; b=RtohOwq/mGWF5aMn8hEPDpMx/rZR9xAALF19Kgyn
	ABnotCfpABau8JwSOXOICFi9m0+JYeo5KRmxM7/PZXvfAVZ+xkORF/VXDwTNR3Ph
	HPx+mTISivbCf4otlZINmlEZaKzFvdI6E4ajQHq9yVGAUfZo4nLChDdFD8U1iaE4
	IS1qmtCDKjKe0bte0kvKERccexJ6lHl808lZOQbURByejcjFT3WTBN/nsM8JSd+g
	k1B3AWzsQK6lbv1D9bzTVgUEmdbFOgAkV//+43Xv1+qkGLvzB6NM7Z7dZU1NecZ0
	guNgLQYiFnm+R6mcteg49ubo9IpFgtLwxmbQpqJPkNbHbw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48se16syup-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-samsung-soc@vger.kernel.org>; Wed, 27 Aug 2025 01:50:49 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4b10ab0062aso150796841cf.1
        for <linux-samsung-soc@vger.kernel.org>; Tue, 26 Aug 2025 18:50:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756259448; x=1756864248;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0laXQCaNkR8BdkTEIAIjvxkPU6e+xAcI3sMZOZG++40=;
        b=xMLzhsERj9Xvb08/8fo9Kf+S4ggQCBkxJnTEMK1U+S+kjMHiyjpdar4BejSkt3kvnX
         UB1Yp7DFvOQ9WxKCU4zVo/VyjYkkxEfftPVmv4cei7Hf9NWq+to7Fi0PzkluxDBbX8V/
         2wpqGSBEsWebfE+idIIgeuE1jUfL/lh+kvy507NX0/TVgpBXRiy8c35GKLOfnbPdh79/
         D9KkTqE3G7Qvchlk46WMwd5q9eL+4UYj9c3z2p8W3VytuimTnZDKBwGLoK6KAfc3B/7Y
         6a90kSDkWjNnupINMECb2tQtYEUEId2MCS/d2Vp5ffmRn5JYcIRuhQg26MzC+6mAC27o
         rYog==
X-Forwarded-Encrypted: i=1; AJvYcCVYWk+MrrcxuVYoRl9eg5rHsUGpHh3mWtyfmZTnJ/W/6+TQS3SmIO04exsxexs6xFFmQEhAMctpXQFL2lh/opzP5Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YxKzG2ZHVjNfsS9JRR7WQTWnMST0CnqWX0cm9cFc37S6KrsMffK
	yVTP/X4H/bKTA3D1UCq1QzyFpfIiSAgucz/20fTnYxSUp4jR/5NLx7yDaPWbFHqAxKJ9xtrGWQl
	fgCy6NI+PhiSEASCSorE7dXt75ns4ie26h8N4uGxqWFmDgSb3wa2FbGaAFMMXtphcfQl9dbFS4A
	==
X-Gm-Gg: ASbGnctMzVVCyW1OvlGVmreshuvXLA5tsOekJYjGJjHzCW3HNrXwW5U2V98YYs/kZdo
	rXhpBX8xKQrRPAvXo5+m3hQpb4YFWbvlikkGwzuWEKX4fTTQ5k4xKTrD/z7wmVY2SnbN2war4Wd
	VYwSR4mh34wQdb7gmbIuYit8EE7gmQA3/mJdOyjodKfdjQ842VVQx0b8W/vogr5itAJw2zG0REF
	9HHaFqNYm/JUPx90GyX8yLtl24GTHyxj1fM2PpkUdxJRzxQppLxZzrQnLiQYQs4vpSTXBp1sJcn
	8vVuN/GK14A6MJ3WS6c2bIBOeBbsj+WsYYXgBjjCwz0Xa1Fn0NqNZVnafXUo0ppnUZ1Wchvh1+q
	MpsmxnvZB8wH1qsKjej3SWqkqkzv3dAddRX2Zd1VPVIQxP5xlntKA
X-Received: by 2002:ac8:5e12:0:b0:4ae:6b72:2ae2 with SMTP id d75a77b69052e-4b2aaacef55mr186156941cf.40.1756259448008;
        Tue, 26 Aug 2025 18:50:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGMxKJaOrtRDBj0yHJf7PhiEmF+htiaol/DYqvG4rG8Xn2tdgOPzsKsBrI5J0XgVP0gDX2TkA==
X-Received: by 2002:ac8:5e12:0:b0:4ae:6b72:2ae2 with SMTP id d75a77b69052e-4b2aaacef55mr186156351cf.40.1756259447377;
        Tue, 26 Aug 2025 18:50:47 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55f4b46d050sm989200e87.150.2025.08.26.18.50.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Aug 2025 18:50:46 -0700 (PDT)
Date: Wed, 27 Aug 2025 04:50:44 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Louis Chauvet <louis.chauvet@bootlin.com>,
        Haneen Mohammed <hamohammed.sa@gmail.com>,
        Melissa Wen <melissa.srw@gmail.com>, Jyri Sarha <jyri.sarha@iki.fi>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Paul Cercueil <paul@crapouillou.net>,
        Liviu Dudau <liviu.dudau@arm.com>,
        Russell King <linux@armlinux.org.uk>,
        Manikandan Muralidharan <manikandan.m@microchip.com>,
        Dharma Balasubiramani <dharma.b@microchip.com>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Claudiu Beznea <claudiu.beznea@tuxon.dev>,
        Inki Dae <inki.dae@samsung.com>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>, Liu Ying <victor.liu@nxp.com>,
        Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
        Lucas Stach <l.stach@pengutronix.de>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Anitha Chrisanthus <anitha.chrisanthus@intel.com>,
        Edmund Dea <edmund.j.dea@intel.com>,
        Paul Kocialkowski <paulk@sys-base.io>,
        Sui Jingfeng <suijingfeng@loongson.cn>,
        Chun-Kuang Hu <chunkuang.hu@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Sandy Huang <hjc@rock-chips.com>,
        Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>,
        Andy Yan <andy.yan@rock-chips.com>, Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Mikko Perttunen <mperttunen@nvidia.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Hans de Goede <hansg@kernel.org>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>,
        Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-mips@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, imx@lists.linux.dev,
        linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
        linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org
Subject: Re: [PATCH 26/39] drm/msm/mdp5: Switch to
 drm_atomic_get_new_crtc_state()
Message-ID: <dc2sfo6edj4w3qiwldoglaanbi2h7mmev7x4pklwbl7x6x6rah@kjyc52pv2xqy>
References: <20250825-drm-no-more-existing-state-v1-0-f08ccd9f85c9@kernel.org>
 <20250825-drm-no-more-existing-state-v1-26-f08ccd9f85c9@kernel.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250825-drm-no-more-existing-state-v1-26-f08ccd9f85c9@kernel.org>
X-Proofpoint-GUID: DkBLOsVyJDoHpIIu7MfK4Ist3dikTrGt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODI2MDEyMCBTYWx0ZWRfX048UbKuEj8M6
 LOgNZsx1aXdaY5R3J6mY1SQgLAN4KSsa+aZ6j5HNcP33ST9UWWRLlOx8uzgMLoSEIUV/VukAd0h
 8DuUCHGFeRVns8E07Y6zjXhGXRxwhHw4LUMZ8cVa4MXHhk5aWSvaYPlnw8vxD+6qx/7JwXQ/8lV
 507pgjDZ9iB362hkqGbY7KrcwHrccgsBZfgSO/5MoX6fsc4Yqa634C0FVYAFv4DJ/rfgEG5E5Jw
 BlXJs2Vi9KEavk4StjPdJJ09ZI/hPpM1eBP68kWam7HlxjOJtweqSX3Nc6L9dgkQ/ZgUvwj1ubB
 NylxRmyAmbCYKLY+4nBF+m2UAlT7tK7QvWsdW9MX0LrQGUGDoV+pEYDlNoyAslUwd4NYOt/nyQ7
 c1WJ8haI
X-Proofpoint-ORIG-GUID: DkBLOsVyJDoHpIIu7MfK4Ist3dikTrGt
X-Authority-Analysis: v=2.4 cv=CNYqXQrD c=1 sm=1 tr=0 ts=68ae6479 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=viL_tbrIvFpnGUkEXy0A:9
 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-26_02,2025-08-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 priorityscore=1501 adultscore=0 spamscore=0
 phishscore=0 suspectscore=0 bulkscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508260120

On Mon, Aug 25, 2025 at 03:43:31PM +0200, Maxime Ripard wrote:
> The msm atomic_check implementation uses the deprecated
> drm_atomic_get_existing_crtc_state() helper.
> 
> This hook is called as part of the global atomic_check, thus before the
> states are swapped. The existing state thus points to the new state, and
> we can use drm_atomic_get_new_crtc_state() instead.
> 
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
>  drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

To merge through drm-misc-next:

Acked-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

