Return-Path: <linux-samsung-soc+bounces-10723-lists+linux-samsung-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E36FAB4334D
	for <lists+linux-samsung-soc@lfdr.de>; Thu,  4 Sep 2025 09:04:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 251EC1887249
	for <lists+linux-samsung-soc@lfdr.de>; Thu,  4 Sep 2025 07:04:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45C972882C8;
	Thu,  4 Sep 2025 07:04:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=grimler.se header.i=@grimler.se header.b="eEDM4FH9"
X-Original-To: linux-samsung-soc@vger.kernel.org
Received: from out-174.mta1.migadu.com (out-174.mta1.migadu.com [95.215.58.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F809233D9E
	for <linux-samsung-soc@vger.kernel.org>; Thu,  4 Sep 2025 07:04:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756969461; cv=none; b=KTAihPvx8mRvri/UTP2cuRjMiYfxou7JxIScjkBoVp2Ra6jMHfItCPMMdiSaeyOAZiUXRdoFKFBX7NbOqy2QzHnSTGE/DNdBKTytzvrJEzeqCjkCX0/IxEqLmgrhRv7EQjrrZyJAOFKlC/71IVAuwasOMNibKfHn31cEK0x8Tck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756969461; c=relaxed/simple;
	bh=IhKT8x/5hCHSHndLowOHkoRm2QFYbcT6oimaswr9Lqc=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=lk0oVZx/PaqibPha4tyCGjBTJRA2MYDoGsFAh/NA57ytqxxQ8agF18v7P6G0jNqA0RIKOT6BzPDMB3ZOmdnrVXTq47SzAyvj8tSxSpDb6Z1iSCwpmIVIQyNRIeY1GC6XS0bUo4JUR7fT7Zy15HG2RmWoNUR1LnoM5uyTa1gAtDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=grimler.se; spf=pass smtp.mailfrom=grimler.se; dkim=pass (1024-bit key) header.d=grimler.se header.i=@grimler.se header.b=eEDM4FH9; arc=none smtp.client-ip=95.215.58.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=grimler.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=grimler.se
Message-ID: <c649f29d3c0c6cb5718dfec1159fdaabe3ee3463.camel@grimler.se>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=grimler.se; s=key1;
	t=1756969456;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IhKT8x/5hCHSHndLowOHkoRm2QFYbcT6oimaswr9Lqc=;
	b=eEDM4FH9yI5P7vlZLnXRLJiTuwuS7NbJ0sViZP4Ds5PvNDHS5xy40WQR1dsvIDd4E8365Y
	+gW50vQHutvD8LEcJ87QAoY8UYIZ5pbO5gW+uRpVTTBMyZ/975w9O3bpjlf1MhyRMkxkDZ
	8jHqnE6DVw5hvRJenMlC/j87WKxYj+A=
Subject: Re: [PATCH v3 3/3] drm/bridge: sii9234: use extcon cable detection
 logic to detect MHL
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Henrik Grimler <henrik@grimler.se>
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Andrzej Hajda	
 <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>, Laurent Pinchart
 <Laurent.pinchart@ideasonboard.com>, Jonas Karlman	 <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Maarten Lankhorst	
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 	dri-devel@lists.freedesktop.org,
 linux-samsung-soc@vger.kernel.org, 	~postmarketos/upstreaming@lists.sr.ht,
 replicant@osuosl.org, 	linux-kernel@vger.kernel.org
Date: Thu, 04 Sep 2025 09:04:11 +0200
In-Reply-To: <532937cb-fa69-4010-b2cf-cba9a2e6c730@samsung.com>
References: <20250824-exynos4-sii9234-driver-v3-0-80849e716a37@grimler.se>
		<CGME20250824111745eucas1p20e336aecd501200bdd035bfc30ce1e63@eucas1p2.samsung.com>
		<20250824-exynos4-sii9234-driver-v3-3-80849e716a37@grimler.se>
		<ac222017-d4e2-4fa7-beed-cc6b73042a73@samsung.com>
		<20250903193231.GA5526@l14.localdomain>
	 <532937cb-fa69-4010-b2cf-cba9a2e6c730@samsung.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Migadu-Flow: FLOW_OUT

Hi Marek,

On Thu, 2025-09-04 at 08:40 +0200, Marek Szyprowski wrote:
> On 03.09.2025 21:32, Henrik Grimler wrote:
> > On Mon, Aug 25, 2025 at 04:16:50PM +0200, Marek Szyprowski wrote:
> > > On 24.08.2025 13:16, Henrik Grimler wrote:
> > > > To use MHL we currently need the MHL chip to be permanently on,
> > > > which
> > > > consumes unnecessary power. Let's use extcon attached to MUIC
> > > > to enable
> > > > the MHL chip only if it detects an MHL cable.
> > > >=20
> > > > Signed-off-by: Henrik Grimler <henrik@grimler.se>
> > > Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
> > >=20
> > > On Trats2 board the status of HDMI connector is no properly
> > > reported as
> > > disconnected when no cable is attached.
> > Thanks for testing (again)!
> >=20
> > In what way is it not properly reported as disconnected, are you
> > checking some sysfs property, or with some userspace tool?
>=20
> Huh, my typo. It should be 'connector is *now* properly reported',=20
> that's why I gave my 'tested-by' tag.

That clears it up, thank you :)

Best regards,
Henrik Grimler

