Return-Path: <linux-samsung-soc+bounces-10908-lists+linux-samsung-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 03C99B54A67
	for <lists+linux-samsung-soc@lfdr.de>; Fri, 12 Sep 2025 12:52:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 640A11882B7C
	for <lists+linux-samsung-soc@lfdr.de>; Fri, 12 Sep 2025 10:52:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3D8F2FD1DA;
	Fri, 12 Sep 2025 10:52:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KglbGKZy"
X-Original-To: linux-samsung-soc@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AE1D1DF270
	for <linux-samsung-soc@vger.kernel.org>; Fri, 12 Sep 2025 10:52:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757674323; cv=none; b=qDTD++tCErRHv313+LyDkxpU+u8BJSO1zAV/WMDMYNcmDEQ+0uvwQnCpKYfqmll/MeA1cCpDLMr3Lxxwl41QUU0KKcyoSDmoxYJSKsll+W+r6fB21Fb4fSEsRWoB1MiTqbZIcJXdxxCdP0wmggfAjHzOSon8WmZzf9f5ITVjmA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757674323; c=relaxed/simple;
	bh=2mCcRgYLTkoEeIMBvhxFuKdvbYMACke7RCFFtoEnbNQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DhaaR4cJqw6IgDzB5w8fRd+OSWZ4FhOxh7WGvcLt6l8kXz2db6joRMsKN4gZp06DfOsqYmSs6P7aaioifCRlxDPWZNgzByQN8yPUUT98Fzl3lAvNKk26ZMqYKvuuDLu+f+ik24uOZ1LEHR/6YbAdEGeo4FHyjEUiRr9HjBEmK8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KglbGKZy; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58C9fGKW019756
	for <linux-samsung-soc@vger.kernel.org>; Fri, 12 Sep 2025 10:52:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=sc6ZaRdU870GtUz0ddcaJRC5
	N+bG/TcHWfDRb085fYA=; b=KglbGKZyau0m7rAfBtql8TcV3fcXhTM7IRNfHSM4
	rF2R3h55HNvAAehUvUeSIJipGzrkTmsIXkpAP4Zp3ct56EckVcUgbSE37bG3m9/x
	DZE8ngbQ2V+07qXuBQAu/PWgi7Ae3u+9Pgjz2t4qDH7+QpdpkOgfSStc1tPR/BIO
	AEqVJgKVNn4mXEAeb1xuKqynNrJoi25eFFzp+dtMBenfkCxG1f80DWz+E1ezUGv1
	3wbBWm6QU599/45i10OCayUyfxJJTYNsHoo6wq/EdlS4qID7rmiAtrd7iK4qm469
	gteRU/oxWdaTh+ANAeoDnrxfKWeYpEBhUjqu0ctuhdO17g==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 491t387nwq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-samsung-soc@vger.kernel.org>; Fri, 12 Sep 2025 10:52:01 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4b5d5cc0f25so35985001cf.2
        for <linux-samsung-soc@vger.kernel.org>; Fri, 12 Sep 2025 03:52:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757674320; x=1758279120;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sc6ZaRdU870GtUz0ddcaJRC5N+bG/TcHWfDRb085fYA=;
        b=QWK4znBXc04apbbIAnAwGB8D64hGCNE5gOC3cusLJwe1pD04OtK9DW7EuUGJJT0rLV
         GK1rVqxnuTeWPDShhsNtY0qXemClxVQK0uowVZI6zMBN8G6E+Tf9cMyedVghxY6QAtkC
         E45RKlIaFXzInvC8viOwxXyN9niIRoATGhfKEAgKvLzXDLD48uYL03DVVYzCf1zqz2nU
         goO10/4iQtlyZEJ/KvVjmkwCRVpZUcHA55h3O4JoqmYJmltn+KsByFmAo4s0cWSLRk8N
         k0WJv55rXwumEgUQQwHJ0I9qaD9IgF3ltRELaqSMUjQnY2CA7NEgfQJ6vvWEChdxsfWF
         GNOw==
X-Forwarded-Encrypted: i=1; AJvYcCXEjiA1KpNaKIHdk2zaEqNCG/OUqlaEJKamIT19osHpRnqnscQA3sr8ceHmNEcFbjzjzEQGZBuiU8rnA78uyCmS4Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YwU8slj6cs/RhS9mYATfrIBuuqPhw7KkNkE6sjVzWu58Luxo2Y+
	AMKnV2KDbxPyRxG3S1q+8/HGSsrHhRKKoZZYpPO+kLT1/T+AYq4z+aIgPAyCxXiccglN8ixLdhR
	rwJ+xS+qO32uaDlWEM6OpbasJELzX1iQVnFW+LMaS/HE0o7Cxc0YLTLylYZGHbSEGC6BwpkdlSw
	==
X-Gm-Gg: ASbGncvRKFDzxcPiP0z5z/INJvhlrctjRBJyTqdcaEikJ4Pqy/i5dJR+2Ym40XwJZk4
	1oxxUgoMamCCqdm0yv7b+TOyZOJ3IdUhl1ruIhvJvBwF2lmlNqVYrG9NJowt2q6YMym2C+DQFjK
	SN++FAY0m6LtikcP1S2TanXO+1/P9nPqM5YzCC6RHZiYWxiMS//T8M/jefI53r+WL1lOnqLLy6q
	jALnLmcto31fG0DdC/VYNNd5/NmHUDRq876vn88S+W3Yd32X8phMhZLeRPFpJRcHOBUTHZR2FjK
	1knBsXZlfKIeqvLHzzlxVSkerB9hx9eazKBKrpCOBUL2hh46pf2sqJTzFTZXXzPgLKWK3DJ2qXS
	fcbiLJdJCVUDC1salYEbw+kOzaW2gSs+zrdyuBxAp0pArckwybMrO
X-Received: by 2002:a05:622a:355:b0:4b3:5081:24c8 with SMTP id d75a77b69052e-4b77d14cce4mr29097441cf.56.1757674319866;
        Fri, 12 Sep 2025 03:51:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG1+roIEGAbRV03P+o9D7MGOVoPmamN2QAkYmfx/FAe0qn4B/Og1foVsAi/kIVH/xOLtFDijA==
X-Received: by 2002:a05:622a:355:b0:4b3:5081:24c8 with SMTP id d75a77b69052e-4b77d14cce4mr29097151cf.56.1757674319346;
        Fri, 12 Sep 2025 03:51:59 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-34f1a821180sm7960691fa.32.2025.09.12.03.51.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Sep 2025 03:51:58 -0700 (PDT)
Date: Fri, 12 Sep 2025 13:51:55 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Damon Ding <damon.ding@rock-chips.com>
Cc: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
        Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
        jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
        mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
        simona@ffwll.ch, jingoohan1@gmail.com, inki.dae@samsung.com,
        sw0312.kim@samsung.com, kyungmin.park@samsung.com, krzk@kernel.org,
        alim.akhtar@samsung.com, hjc@rock-chips.com, heiko@sntech.de,
        andy.yan@rock-chips.com, dianders@chromium.org,
        m.szyprowski@samsung.com, luca.ceresoli@bootlin.com,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v5 07/17] drm/exynos: exynos_dp: Add legacy bridge to
 parse the display-timings node
Message-ID: <xwenycscalzdlpuxytorbiyvej3k7pv3lhxwtadilxq65ipwsv@x5rxm53w5e22>
References: <20250912085846.7349-1-damon.ding@rock-chips.com>
 <20250912085846.7349-8-damon.ding@rock-chips.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250912085846.7349-8-damon.ding@rock-chips.com>
X-Proofpoint-ORIG-GUID: oDFFBLyJm4jySQviStTLAxAWcKcOjgPj
X-Proofpoint-GUID: oDFFBLyJm4jySQviStTLAxAWcKcOjgPj
X-Authority-Analysis: v=2.4 cv=NdLm13D4 c=1 sm=1 tr=0 ts=68c3fb51 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=s8YR1HE3AAAA:8 a=xJsYSp2GQeFlw7CnCu0A:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22 a=jGH_LyMDp9YhSvY-UuyI:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA4MDA2NiBTYWx0ZWRfX9y/Fe1e0/GOY
 fLg6CoBQG7VYTuwX9LfUR9tnS5lghNaE7eayil8Riwk0piZHjByk423/K8HY0uSCFZfDTeD2/Go
 lyDhm5hotLD5XGwkq2eFtBlstvJwpETFhzSKIFR0sF0nvOD0J93zuD58URsK97MGzvDtuHNd46t
 WdfwvT2DCKYnXDaZv3tT/eLROcTLboTahJI21JLMplkduTTT5mYQDyftK7c9/cnGNf5lgSlx9z5
 FlPNyfenF+eRsOHVvUmt/ClqELJwNC2SIO1PFIctaNIGuCSJnp5O0FZHV46K8e4Fj0aEEs9Plhd
 dTddHBDIczhd2AmKoDKymFHhw3qnzlMuMOebWDat4/K+4IBA4TPsQkoLUWW3WGYjIVjo5137lrM
 /d2y2Dab
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-12_04,2025-09-11_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 adultscore=0 suspectscore=0 phishscore=0
 clxscore=1015 impostorscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509080066

On Fri, Sep 12, 2025 at 04:58:36PM +0800, Damon Ding wrote:
> If there is neither a panel nor a bridge, the display timing can be
> parsed from the display-timings node under the dp node.
> 
> Adding a legacy bridge to parse the display-timings node would get
> rid of &analogix_dp_plat_data.get_modes() and make the codes more
> consistent.

If it's the same as imx-legacy-bridge, it might make sense to pull it
out of imx/ subdir and use it as is.

> 
> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
> ---
>  drivers/gpu/drm/exynos/exynos_dp.c | 132 ++++++++++++++++++-----------
>  1 file changed, 82 insertions(+), 50 deletions(-)
> 

-- 
With best wishes
Dmitry

