Return-Path: <linux-samsung-soc+bounces-5254-lists+linux-samsung-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E959C9BDAF2
	for <lists+linux-samsung-soc@lfdr.de>; Wed,  6 Nov 2024 02:09:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8B094283697
	for <lists+linux-samsung-soc@lfdr.de>; Wed,  6 Nov 2024 01:09:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD4EA165F11;
	Wed,  6 Nov 2024 01:09:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="SXXXX5jy"
X-Original-To: linux-samsung-soc@vger.kernel.org
Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AE3313A26F
	for <linux-samsung-soc@vger.kernel.org>; Wed,  6 Nov 2024 01:09:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730855393; cv=none; b=bCA+B+uWIOjEeH5maMHNcrvw/9d/MkKr+yHRcbVnBRHiLjd2shKGNtPq4ejJ9kASJKCJzvKH0KleCpPEBTd9CGd/WsZiusgP1aXG+x4OYxwN+g7brqgVMj3ZeiRNatNvDX4TC6dKWwP3QgJjNWwdxlotHCsH1EHgsKpcy9dRZzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730855393; c=relaxed/simple;
	bh=vK4kcOeN8Xtnna1ohwIQuvV8+GzxsBDP8xGbdB9jv/c=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 References; b=pXzplFf4JCSW1DHsnK0YzPCdichQ6wxr+jDnDWaLyMvyM7apSwhxAxIX7ZQ/ohyAmoCLmOn51qIU7qvL1VppO1OX8eW3BxUB7P6JSWyVLYhjPpK6xlhkeZ7301rTE9E3XAFkx582Agumo+D0Vv8xieUooP2rhfhxEaUfoZ9qZyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=SXXXX5jy; arc=none smtp.client-ip=203.254.224.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from epcas1p3.samsung.com (unknown [182.195.41.47])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20241106010947epoutp03ef2c8c3024e5bf58490079907dcb63f0~FO83pn49Q1762717627epoutp03F
	for <linux-samsung-soc@vger.kernel.org>; Wed,  6 Nov 2024 01:09:47 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20241106010947epoutp03ef2c8c3024e5bf58490079907dcb63f0~FO83pn49Q1762717627epoutp03F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1730855387;
	bh=6umq/16iIANNEU7JvbK4xKwhJ2ZrU10o+5g3VMh3FS0=;
	h=From:To:Cc:Subject:Date:References:From;
	b=SXXXX5jyr2P3Sps95a8xjzUn2o70ZdY5xYs5HfrGSUKxCEp3cSrJvjn7lSwyO95YD
	 yTB0jNh9pTw5kLY+sjsd2dUBNZrb2H1WgDavH7hU3ghtrYCntbu6CEc3CvP0fdVr+f
	 LREdPrwrvmBVZ0Jjnl5eey3zm8kgNbeBzcnY3Npw=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
	epcas1p2.samsung.com (KnoxPortal) with ESMTP id
	20241106010947epcas1p29e0a62cc999eb45fc655ff56f2765f1b~FO83fHGIo1937219372epcas1p29;
	Wed,  6 Nov 2024 01:09:47 +0000 (GMT)
Received: from epsmges1p1.samsung.com (unknown [182.195.38.232]) by
	epsnrtp3.localdomain (Postfix) with ESMTP id 4XjnDT6QrXz4x9QB; Wed,  6 Nov
	2024 01:09:45 +0000 (GMT)
Received: from epcas1p3.samsung.com ( [182.195.41.47]) by
	epsmges1p1.samsung.com (Symantec Messaging Gateway) with SMTP id
	50.54.09406.8D1CA276; Wed,  6 Nov 2024 10:09:44 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
	epcas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20241106010943epcas1p1f43d635384661d8dc4a401c5b82b25af~FO80OXgA61744117441epcas1p14;
	Wed,  6 Nov 2024 01:09:43 +0000 (GMT)
Received: from epsmgmcp1.samsung.com (unknown [182.195.42.82]) by
	epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20241106010943epsmtrp2af5808b38444b5573c7d797f6d519a55~FO80NxOP31645916459epsmtrp2X;
	Wed,  6 Nov 2024 01:09:43 +0000 (GMT)
X-AuditID: b6c32a35-aa3fa700000024be-1d-672ac1d8af12
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
	epsmgmcp1.samsung.com (Symantec Messaging Gateway) with SMTP id
	8E.8C.18937.7D1CA276; Wed,  6 Nov 2024 10:09:43 +0900 (KST)
Received: from localhost.localdomain (unknown [10.113.221.211]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20241106010943epsmtip1822b9cb169ba666606aea9faca9d4836~FO80BeeLe1306513065epsmtip19;
	Wed,  6 Nov 2024 01:09:43 +0000 (GMT)
From: Inki Dae <inki.dae@samsung.com>
To: airlied@linux.ie, daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org
Subject: [GIT PULL v2] exynos-drm-next
Date: Wed,  6 Nov 2024 10:09:43 +0900
Message-Id: <20241106010943.796273-1-inki.dae@samsung.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrEKsWRmVeSWpSXmKPExsWy7bCmvu6Ng1rpBvvusln0njvJZPF/20Rm
	iytf37NZzDi/j8mBxWPvtwUsHtu/PWD1uN99nMnj8ya5AJaobJuM1MSU1CKF1Lzk/JTMvHRb
	Je/geOd4UzMDQ11DSwtzJYW8xNxUWyUXnwBdt8wcoJVKCmWJOaVAoYDE4mIlfTubovzSklSF
	jPziElul1IKUnALTAr3ixNzi0rx0vbzUEitDAwMjU6DChOyMh4d3MRVc5664dP8eSwPjW84u
	Rk4OCQETiY0z5rN2MXJxCAnsYJS4fGgOO4TziVGiffYjBOdJ5xZWmJaDe+ayQSR2MkosWHgS
	yvnCKPFj7S92kCo2AVWJiSvus4HYIkD220mPmUFsZgE3iT9Lz7KA2MICahKbLt1nArFZgGre
	PL8GVsMrYCWx4MwkFoht8hIzL31nh4gLSpyc+YQFYo68RPPW2cwgiyUE1rFLrL/7hx2iwUXi
	zv9WqGZhiVfHt0DFpSQ+v9vLBtEwmVHizvUVLBDODEaJwz+vM0JUGUvsXzoZ6CQOoBWaEut3
	6UNs45N497WHFSQsIcAr0dEmBFGtJHHs4g2oTgmJC0smskHYHhIrd8wGs4UEYiUePb3AOIFR
	bhaSH2Yh+WEWwrIFjMyrGMVSC4pz01OLDQsM4XGZnJ+7iRGc2LRMdzBOfPtB7xAjEwfjIUYJ
	DmYlEd55qerpQrwpiZVVqUX58UWlOanFhxhNgaE6kVlKNDkfmFrzSuINTSwNTMyMjE0sDM0M
	lcR5z1wpSxUSSE8sSc1OTS1ILYLpY+LglGpgyoqt5rlTp+/yiCPKj+XiLMakGGcv1qUfObKF
	5kjpVlQ0bpLpzlouxFB7+CPXBiu1vU2uHauvhL5lL5v3f5pvgUO931rDWxvYjM/8vpxg+m6f
	3HvP99t6/Xe9NI6ybwkL3RWe9LD+xJEuhRU1TH0rZoQuCN1QdZ7jxMyK44uOTzoz1fXtkcZp
	b/PPrAj2eflqto68+56zP1Q8W+Y0bO9isEtePO+IHMOSRB+T89kTep6Jdb86/fD+Q32d1HWK
	cb8bTaR0V1f3TKqytg9ddpLZt1X2R/TMrRKbtxfeeNwXcS4+YtcUcc7Nfmfsz1ytzCnSu8Yx
	u/fr3tyXxx1nK9+3sJefod/noh24U+Wf6johJZbijERDLeai4kQAb457DPUDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprKLMWRmVeSWpSXmKPExsWy7bCSnO71g1rpBosalS16z51ksvi/bSKz
	xZWv79ksZpzfx+TA4rH32wIWj+3fHrB63O8+zuTxeZNcAEsUl01Kak5mWWqRvl0CV8bDw7uY
	Cq5zV1y6f4+lgfEtZxcjJ4eEgInEwT1z2boYuTiEBLYzSkxd1MXYxcgBlJCQ2LKVA8IUljh8
	uBii5BOjxPr7E5lBetkEVCUmrrjPBmKLCKhLPLi8kBHEZhbwkHi/ZzU7iC0soCax6dJ9JhCb
	Baj+zfNrYL28AlYSC85MYoG4QV5i5qXv7BBxQYmTM5+wQMyRl2jeOpt5AiPfLCSpWUhSCxiZ
	VjGKphYU56bnJhcY6hUn5haX5qXrJefnbmIEh5xW0A7GZev/6h1iZOJgPMQowcGsJMI7L1U9
	XYg3JbGyKrUoP76oNCe1+BCjNAeLkjivck5nipBAemJJanZqakFqEUyWiYNTqoHJ5Vwtw7Lt
	XWJhPxfb1jQ0fJ1+NOvjZR3r45rCZV8dbdVmdDgqnvTyO3DS5qzzA6HjYv84d+jukdb5Grbk
	kNkpjTuOV19YXr4Xtez244r9L21uH6qIvJWiXsUqLlV44oF3o46h94TPe5tsp8WLpr9iy+Cd
	bHVt9dvp7t8en4n9tqic3/LfgoMPQ5t+PvaY4lmxwknWNE/aTCp710yeK//MZvAdPsz3w3Ph
	L2P/gpPPI2eXPPefpWPx/d2qqnk3uc2v5hSE3Krv495/bIZY1OmZT1eVvGZfsWqBgWPU1Qvz
	9kpE9rU6/ZFvSw5PrYsLviSzaO6xRbrPPNmep84LX2RwqrxxcvaaO7x1Qh7WP6ullViKMxIN
	tZiLihMB95UXDagCAAA=
X-CMS-MailID: 20241106010943epcas1p1f43d635384661d8dc4a401c5b82b25af
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20241106010943epcas1p1f43d635384661d8dc4a401c5b82b25af
References: <CGME20241106010943epcas1p1f43d635384661d8dc4a401c5b82b25af@epcas1p1.samsung.com>

Hi Dave and Daniel,

   Just add a dt-binding patch for supporting Exynos7870 SoC Decon device.

   In the previous pull request, I included patches to support the decon device
   for the Exynos7870 SoC but did not include corresponding binding patch,
   which resulted in warnings on the linux-next tree.
   Therefore, I have merged the binding patch as well.

   Please kindly let me know if there is any problem.

Thanks,
Inki Dae

The following changes since commit 086ed1d51544bfc1123b93eccc2ae88e0fbf3d51:

  Merge tag 'exynos-drm-next-for-v6.13' of git://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos into drm-next (2024-11-05 12:59:52 +1000)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos tags/exynos-drm-next-for-v6.13-v2

for you to fetch changes up to 3bca8bc1fc3a7c66a6a4a5e40b84f6cf128b70e7:

  dt-bindings: display: samsung,exynos7-decon: add exynos7870 compatible (2024-11-06 09:01:53 +0900)

----------------------------------------------------------------
New feature
- Add a compatible string, "samsung,exynos7870-decon", for supporting
  Exynos7870 SoC Decon device

----------------------------------------------------------------
Kaustabh Chakraborty (1):
      dt-bindings: display: samsung,exynos7-decon: add exynos7870 compatible

 .../devicetree/bindings/display/samsung/samsung,exynos7-decon.yaml    | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

