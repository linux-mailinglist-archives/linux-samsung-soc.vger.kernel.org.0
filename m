Return-Path: <linux-samsung-soc+bounces-8278-lists+linux-samsung-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0723EAA0F44
	for <lists+linux-samsung-soc@lfdr.de>; Tue, 29 Apr 2025 16:42:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 27FD016D73D
	for <lists+linux-samsung-soc@lfdr.de>; Tue, 29 Apr 2025 14:42:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD1562185BD;
	Tue, 29 Apr 2025 14:42:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WaLLtT5C"
X-Original-To: linux-samsung-soc@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BEC621773F
	for <linux-samsung-soc@vger.kernel.org>; Tue, 29 Apr 2025 14:42:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745937765; cv=none; b=keRoWHOAdAR1Dj8HCHwMU4156gIYRGNQH/Cn+T/TjO/UFdvAJQIQIMfub/p2cTbv/eBbObGrWlIDQz4sHDKzrfsiRE5Pb8sRb4IywAuSxq4Y1PXF+ClCIrYZeURtN/lNqXBIQIjQuCoQZEeiiKk3V6rpK7z5DZDjDvbBIyPNBEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745937765; c=relaxed/simple;
	bh=ZdBlqcD7UgXi/cmHBjpAFe6EpoLl9MO34xzM6rTx074=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jXX+E9mL8KCRShSvGdtctHjAikFQkxLe4ZM4VFKKTJnzkwhiAJ8SWBZE5jZkYCSyPITTnIb7TJ9Ufvphwf6I0wQL0eMOh+s9hlOUajpayJC/WLiFnZI0mdaobHSs4e116wi1loeisigeLFnioNcGsWHxCYYreZ93V4y/IoUvni8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WaLLtT5C; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53TAUkde032014
	for <linux-samsung-soc@vger.kernel.org>; Tue, 29 Apr 2025 14:42:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=95T6lUWWSMvDyPMIc22M5eNK
	HqFKHq2wCTghZ6/oaJE=; b=WaLLtT5C8FQJcBDimbkuPt6TTht/cqWy5fKvWqMW
	ILpQ4FF1A55IxDrswWlIclW1piFJUsnCWdTYFUGmuQysFPqImmV7yUh6xBE/ilPR
	bb2G6myBogFm4RPgPQrk+conHuGunajECg0n9cIdzK9XsFIwHOvJ5mFV1RUDGjbs
	ZNqm9qaxetcA0D+BTMmzHMm8am9RMW5W5xHeAzwGubxvVQ5DwqDd/2+Mf+3fMfTg
	YZ47bkm9K/StMh6cpwHU8/Epk21WTDsx2zpEdRJiFUZw5CT6/OzmtbcaRFmkse0p
	jVHxBm/tqOBWWPBV3MuZV4aGW4uImQHirEavkGqJTHITLQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 468pevm0xe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-samsung-soc@vger.kernel.org>; Tue, 29 Apr 2025 14:42:43 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c5bb68b386so393265485a.3
        for <linux-samsung-soc@vger.kernel.org>; Tue, 29 Apr 2025 07:42:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745937762; x=1746542562;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=95T6lUWWSMvDyPMIc22M5eNKHqFKHq2wCTghZ6/oaJE=;
        b=fyxuIcRiz23bDoF917NfJzGorJJ73GFHnRgDeFn2u7JJyOcN4hRXh1j/FOiY36N/Ym
         ileTB5kD5ucvJOzAn+Y2pLzkQdfZ7Z9o4+CR6/DzUW1NH1ivujQyqziiu3ipAwoRE3ME
         rg/4oxFtaZjPMNqemr7YzAIM+AWyeV7PZcM3k65RHS9SyktP2NuMwIE8RXUfUi9Rb7KX
         1qxXZnqnpK8wbVgv0PXYI34ssK3r1JNi9kidRVHM/XNsOUc8FQ0Im7n+EROQyiykwdZ0
         75gIZMR8uWH5mJhB0HxBe3tx8uwBF88ejGpRTuShI5gCaueLmzN4CL1YHnfPSZUgWNog
         VMeg==
X-Forwarded-Encrypted: i=1; AJvYcCWCFjqJJI/l1S5ILEYGD52rK24v4eIJ5baK56e4NGO6m3F8V/N8TGrAiiWVD7gu/rn1SHEDtfm4rP6kgCBPLLQZ4w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9j9FDxHoWDoroJiaDwyuq64yhTAC3cSxPQcKfvUxfCePOP5lK
	ZPc+R0OjK90FBr9PefNFVWF6mgVcZ/kUJko3nGdlQCmRCg8qkkylRZF1/dkqbIasSsrc4jIhUYW
	+vo1ROP0vLgejiWo1OX2JlfxUx8fgzcA/qkZo9LjnwS0VdRwrjVVf2l0uHyZYZI1gyy91AA==
X-Gm-Gg: ASbGncsd1dKidQHgUZPFSVqyeVeRkW+fsO+VjEFRs7cCcyaAJhQEUeN2li0BvzWrKx5
	0KrgU9f8qB5VSJT9JqaM+n/HAHsu+D6Ia+kkKTKoF8+IY9Fx1ZqgSkeSxNWmcfgLDtfhbYAU1dJ
	581ekdNuC4SEuMItYlr/UjfPBRd5RfnX1UV0QCUjm77WQAA5H6/M5H1V8g87ym0K4J7UimRdLzP
	hlmLWblZOmCdB/4Lp2oTHbqIW5FEv+qyP3JL1w+co1hptRHj4/cJE75IdaMQWdooQJP6Qoezk4t
	IvGy5PAEz96uemXgDNSx31EL6jqwB7bHoZMDeBwGCXLhUYFYHHg68zA8XsVmYLoGUv2/II+LpX0
	=
X-Received: by 2002:a05:620a:4609:b0:7c5:6a66:5c1e with SMTP id af79cd13be357-7c9668cdc37mr2109275785a.58.1745937761638;
        Tue, 29 Apr 2025 07:42:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEDNJAkS5MxDnNhkLq8y60Bm1ZZecLba9P4Zw5IB7TV0UsyjpIf9foZNs6LWwIvq9tQDTlZsQ==
X-Received: by 2002:a05:620a:4609:b0:7c5:6a66:5c1e with SMTP id af79cd13be357-7c9668cdc37mr2109266985a.58.1745937761023;
        Tue, 29 Apr 2025 07:42:41 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54e7cb26258sm1895708e87.17.2025.04.29.07.42.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 07:42:40 -0700 (PDT)
Date: Tue, 29 Apr 2025 17:42:38 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Louis Chauvet <louis.chauvet@bootlin.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Jagan Teki <jagan@amarulasolutions.com>,
        Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Douglas Anderson <dianders@chromium.org>,
        Chun-Kuang Hu <chunkuang.hu@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Anusha Srivatsa <asrivats@redhat.com>,
        Paul Kocialkowski <paulk@sys-base.io>,
        Dmitry Baryshkov <lumag@kernel.org>, Hui Pu <Hui.Pu@gehealthcare.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        dri-devel@lists.freedesktop.org, asahi@lists.linux.dev,
        linux-kernel@vger.kernel.org, chrome-platform@lists.linux.dev,
        imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-amlogic@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org,
        linux-stm32@st-md-mailman.stormreply.com,
        Adam Ford <aford173@gmail.com>,
        Adrien Grassein <adrien.grassein@gmail.com>,
        Aleksandr Mishin <amishin@t-argos.ru>,
        Andy Yan <andy.yan@rock-chips.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Benson Leung <bleung@chromium.org>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Christoph Fritz <chf.fritz@googlemail.com>,
        Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
        Detlev Casanova <detlev.casanova@collabora.com>,
        Dharma Balasubiramani <dharma.b@microchip.com>,
        Guenter Roeck <groeck@chromium.org>, Heiko Stuebner <heiko@sntech.de>,
        Jani Nikula <jani.nikula@intel.com>, Janne Grunau <j@jannau.net>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Jesse Van Gavere <jesseevg@gmail.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Liu Ying <victor.liu@nxp.com>,
        Manikandan Muralidharan <manikandan.m@microchip.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>, Phong LE <ple@baylibre.com>,
        Sasha Finkelstein <fnkl.kernel@gmail.com>,
        Sugar Zhang <sugar.zhang@rock-chips.com>,
        Sui Jingfeng <sui.jingfeng@linux.dev>,
        Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
        Vitalii Mordan <mordan@ispras.ru>,
        Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Hans de Goede <hdegoede@redhat.com>,
        Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
        "Rob Herring (Arm)" <robh@kernel.org>,
        Hsin-Te Yuan <yuanhsinte@chromium.org>,
        Pin-yen Lin <treapking@chromium.org>, Xin Ji <xji@analogixsemi.com>,
        Aradhya Bhatia <a-bhatia1@ti.com>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Ian Ray <ian.ray@ge.com>, Martyn Welch <martyn.welch@collabora.co.uk>,
        Peter Senna Tschudin <peter.senna@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Herve Codina <herve.codina@bootlin.com>,
        Alim Akhtar <alim.akhtar@samsung.com>, Inki Dae <inki.dae@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Bjorn Andersson <quic_bjorande@quicinc.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Helge Deller <deller@gmx.de>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Subject: Re: (subset) [PATCH v2 00/34] drm: convert all bridges to
 devm_drm_bridge_alloc()
Message-ID: <sdiwpe7nnhud3fvkgijjbfyenlwpchbxgehyxmsy7c5loo257h@hkfcawkjrlhd>
References: <20250424-drm-bridge-convert-to-alloc-api-v2-0-8f91a404d86b@bootlin.com>
 <174591887152.961603.7706063017853945511.b4-ty@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <174591887152.961603.7706063017853945511.b4-ty@bootlin.com>
X-Proofpoint-ORIG-GUID: TV6jZGF_Fir6F9F4k82jCbCbypaOvy3F
X-Authority-Analysis: v=2.4 cv=aeBhnQot c=1 sm=1 tr=0 ts=6810e563 cx=c_pps a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=1X4oNAvfgwtBicUf-4YA:9 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: TV6jZGF_Fir6F9F4k82jCbCbypaOvy3F
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI5MDExMCBTYWx0ZWRfX7QnUkMvpaHo7 FdqwExNbvoCQEz1LxYMlLE28MUxzfCIKKzuVpNdearJWZwI3E9jv4Zaf1vgghFxqxsbL+t+XbCV /aQIwR32I/oEJpx0ZTenkh87a4h812Uk8hi5bfS6fV+6xrxjobH+M0LrnycbtEtdI2CbeVnOuCH
 vVROwa89UP10j3GXiSiFLVKBLhr4Fbh+GrfMmD8JqlZoHKTxWMZe8oV11BCCY1SOiIIEBoNVKnh SI0ISX7n709v22SwfUh4QmoGSolYOy11gUtlJ/TeDk1gL+4riKLMC2KvVbzFQolvWbD5K6tl30H f1dfuYN0gJNptiFhnkLJSlv/AAnuHqkb9wshLhUk2uuy5GTaNKHKtRVx4B29NrE0s083UKDLYUE
 EmVXovEUobKfN7Tlf48U7am73/lVfGqclxm221DGKRXk+AdOT4PQBihffJp9ybmWj78B7Asx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-29_05,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 clxscore=1015
 impostorscore=0 bulkscore=0 malwarescore=0 priorityscore=1501 spamscore=0
 mlxlogscore=999 phishscore=0 suspectscore=0 lowpriorityscore=0 mlxscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504290110

On Tue, Apr 29, 2025 at 11:27:51AM +0200, Louis Chauvet wrote:
> 
> On Thu, 24 Apr 2025 20:59:07 +0200, Luca Ceresoli wrote:
> > devm_drm_bridge_alloc() [0] is the new API to allocate and initialize a DRM
> > bridge, and the only one supported from now on. It is also necessary for
> > implementing reference counting and thus needed to support removal of
> > bridges from a still existing DRM pipeline without use-after-free.
> > 
> > This series converts all DRM bridges to the new API.
> > 
> > [...]
> 
> Applied, thanks!
> 

[...]

> [16/34] drm/msm/dp: convert to devm_drm_bridge_alloc() API
>         commit: b2aabe5c6b65516d88214aba4b12ce2ca78bac6c
> [17/34] drm/msm/dsi: convert to devm_drm_bridge_alloc() API
>         commit: fffc8847743e45604c4478f554d628481b985556
> [18/34] drm/msm/hdmi: convert to devm_drm_bridge_alloc() API
>         commit: e11532be87e437648521a8ed5358c56df11933b4

Why? These drivers are explicitly handled outside of drm-misc. Please be
more careful next time.

-- 
With best wishes
Dmitry

