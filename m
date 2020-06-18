Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5C8351FF7BF
	for <lists+linux-samsung-soc@lfdr.de>; Thu, 18 Jun 2020 17:45:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731593AbgFRPn1 (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Thu, 18 Jun 2020 11:43:27 -0400
Received: from mailout2.w1.samsung.com ([210.118.77.12]:38373 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730176AbgFRPkV (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 18 Jun 2020 11:40:21 -0400
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20200618154020euoutp0296e206fcd90262f013a91aa3c7de7c90~ZrZoEB0iU1254412544euoutp02X
        for <linux-samsung-soc@vger.kernel.org>; Thu, 18 Jun 2020 15:40:20 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20200618154020euoutp0296e206fcd90262f013a91aa3c7de7c90~ZrZoEB0iU1254412544euoutp02X
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1592494820;
        bh=R1S3X25A6Vy5KJ2eK9141TIlg+VdgZzNSckapypyqH8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=onFWahYqyazuNqigmpgvmf5orvaOPVjkbeXnGT5HFvWxClu7fc8p4t13P9XlgUYwO
         0o+W7iXRt1u/uX5jW0az/mNqvElxmBRD25mCBohHfVW0FT7KDIMLHV6G7GJmMnv8CG
         knORyeaiLJNC/QQa6Fx3zFeoOoUdeoMY6XBzWg3U=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTP id
        20200618154019eucas1p12b686356ca3a50973be6f466a54240b6~ZrZnqkvCK1547315473eucas1p1P;
        Thu, 18 Jun 2020 15:40:19 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
        eusmges1new.samsung.com (EUCPMTA) with SMTP id 50.1F.61286.3EA8BEE5; Thu, 18
        Jun 2020 16:40:19 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20200618154019eucas1p256a859cb114401d51bd06d521619c9b3~ZrZnVVAee0608006080eucas1p2M;
        Thu, 18 Jun 2020 15:40:19 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20200618154019eusmtrp1fba8bb98ca541146ddfd4e061e42009f~ZrZnUrP_E2169821698eusmtrp1O;
        Thu, 18 Jun 2020 15:40:19 +0000 (GMT)
X-AuditID: cbfec7f2-f0bff7000001ef66-c3-5eeb8ae3f3b4
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id F1.E9.07950.3EA8BEE5; Thu, 18
        Jun 2020 16:40:19 +0100 (BST)
Received: from AMDC2765.digital.local (unknown [106.120.51.73]) by
        eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20200618154018eusmtip104ecfacdff370ad264b37fda58146a14~ZrZmoctLv0765807658eusmtip1Z;
        Thu, 18 Jun 2020 15:40:18 +0000 (GMT)
From:   Marek Szyprowski <m.szyprowski@samsung.com>
To:     dri-devel@lists.freedesktop.org, iommu@lists.linux-foundation.org,
        linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Christoph Hellwig <hch@lst.de>,
        Robin Murphy <robin.murphy@arm.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        linux-arm-kernel@lists.infradead.org,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Inki Dae <inki.dae@samsung.com>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        linux-samsung-soc@vger.kernel.org
Subject: [PATCH v6 08/36] drm: exynos: fix common struct sg_table related
 issues
Date:   Thu, 18 Jun 2020 17:39:29 +0200
Message-Id: <20200618153956.29558-9-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200618153956.29558-1-m.szyprowski@samsung.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrKKsWRmVeSWpSXmKPExsWy7djPc7qPu17HGSyfr2PRe+4kk8XGGetZ
        Lf5vm8hsceXrezaLlauPMllMuj+BxWLBfmuLL1ceMllsenyN1eLyrjlsFjPO72OyWHvkLrvF
        wQ9PWC1mTH7J5sDnsWbeGkaPvd8WsHhs//aA1eN+93Emj81L6j1u/3vM7DH5xnJGj903G9g8
        +rasYvT4vEkugCuKyyYlNSezLLVI3y6BK+NG03Wmgm7hirOL37E1MDYIdDFyckgImEgcfDKX
        BcQWEljBKPH6e2gXIxeQ/YVRYsHdA8wQic+MEpsnWcA0tMy7wARRtJxRovPVRKhuoI7Tn91A
        bDYBQ4mut11sILaIQCujxIleHpAGZoEOZolrE+czgiSEBYIk9m5+xA5iswioSmzafB5sEK+A
        rUT3nE/sENvkJVZvgLiCU8BO4vTxVlaQQRICh9glbnzfCVXkIjF7x11mCFtY4tXxLVBxGYnT
        k3tYIBqaGSUenlvLDuH0MEpcbprBCFFlLXHn3C+gWzmA7tOUWL9LHyLsKHFywxImkLCEAJ/E
        jbeCIGFmIHPStunMEGFeiY42IYhqNYlZx9fBrT144RLUOR4Sh5fNZIOE1kRGiZ45U1gmMMrP
        Qli2gJFxFaN4amlxbnpqsWFearlecWJucWleul5yfu4mRmBiOv3v+KcdjF8vJR1iFOBgVOLh
        dQh/HSfEmlhWXJl7iFGCg1lJhNfp7Ok4Id6UxMqq1KL8+KLSnNTiQ4zSHCxK4rzGi17GCgmk
        J5akZqemFqQWwWSZODilGhhl9K46Ws6XeZdlfNxO/QKH5K4Fv4+Gv9j40udl4f+NJxet1mpe
        Wtg2ccFy+6eXvrNv+LPnfdq5s8ZqZ6ZsOPTw3vHoWS1h18+tOHGxMjX7XW6fru7ZjEh/7lmZ
        +m5rPq7Zuvne84rlF3b0Nr/6Wv0mIj3j9kaGw8I9V2tz1OP+feu+43fBazG/mBJLcUaioRZz
        UXEiABCtTr9IAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprJIsWRmVeSWpSXmKPExsVy+t/xu7qPu17HGVz7IGbRe+4kk8XGGetZ
        Lf5vm8hsceXrezaLlauPMllMuj+BxWLBfmuLL1ceMllsenyN1eLyrjlsFjPO72OyWHvkLrvF
        wQ9PWC1mTH7J5sDnsWbeGkaPvd8WsHhs//aA1eN+93Emj81L6j1u/3vM7DH5xnJGj903G9g8
        +rasYvT4vEkugCtKz6Yov7QkVSEjv7jEVina0MJIz9DSQs/IxFLP0Ng81srIVEnfziYlNSez
        LLVI3y5BL+NG03Wmgm7hirOL37E1MDYIdDFyckgImEi0zLvA1MXIxSEksJRR4sf63ewQCRmJ
        k9MaWCFsYYk/17rYIIo+MUrsn7WDESTBJmAo0fUWIiEi0MkoMa37IzuIwywwgVnifstqsCph
        gQCJg/NmsIDYLAKqEps2nwezeQVsJbrnfIJaJy+xesMBZhCbU8BO4vTxVrDVQkA1zz+0sU1g
        5FvAyLCKUSS1tDg3PbfYSK84Mbe4NC9dLzk/dxMjMFq2Hfu5Beiqd8GHGAU4GJV4eF+EvI4T
        Yk0sK67MPcQowcGsJMLrdPZ0nBBvSmJlVWpRfnxRaU5q8SFGU6CjJjJLiSbnAyM5ryTe0NTQ
        3MLS0NzY3NjMQkmct0PgYIyQQHpiSWp2ampBahFMHxMHp1QDY2+Fns1ME1dd3XvlZqHu/0V+
        Xy1/ltt06OPPMK57n78XzaxdeSD1/cuP+XM0jTokD8sbPt8w9/r6CIkOZfmqmJfTBYWOiHju
        MkpcmzYhfX7P1UuBNYa71n32cD4e3LU6e+05odVf5KYwaXxQUuF49pnVhVtl0rknhw152fbx
        9Lm6/cn94BQ7UYmlOCPRUIu5qDgRAF81YqusAgAA
X-CMS-MailID: 20200618154019eucas1p256a859cb114401d51bd06d521619c9b3
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20200618154019eucas1p256a859cb114401d51bd06d521619c9b3
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200618154019eucas1p256a859cb114401d51bd06d521619c9b3
References: <20200618153956.29558-1-m.szyprowski@samsung.com>
        <CGME20200618154019eucas1p256a859cb114401d51bd06d521619c9b3@eucas1p2.samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

The Documentation/DMA-API-HOWTO.txt states that the dma_map_sg() function
returns the number of the created entries in the DMA address space.
However the subsequent calls to the dma_sync_sg_for_{device,cpu}() and
dma_unmap_sg must be called with the original number of the entries
passed to the dma_map_sg().

struct sg_table is a common structure used for describing a non-contiguous
memory buffer, used commonly in the DRM and graphics subsystems. It
consists of a scatterlist with memory pages and DMA addresses (sgl entry),
as well as the number of scatterlist entries: CPU pages (orig_nents entry)
and DMA mapped pages (nents entry).

It turned out that it was a common mistake to misuse nents and orig_nents
entries, calling DMA-mapping functions with a wrong number of entries or
ignoring the number of mapped entries returned by the dma_map_sg()
function.

To avoid such issues, lets use a common dma-mapping wrappers operating
directly on the struct sg_table objects and use scatterlist page
iterators where possible. This, almost always, hides references to the
nents and orig_nents entries, making the code robust, easier to follow
and copy/paste safe.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 drivers/gpu/drm/exynos/exynos_drm_g2d.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_g2d.c b/drivers/gpu/drm/exynos/exynos_drm_g2d.c
index fcee33a43aca..7014a8cd971a 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_g2d.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_g2d.c
@@ -395,8 +395,8 @@ static void g2d_userptr_put_dma_addr(struct g2d_data *g2d,
 		return;
 
 out:
-	dma_unmap_sg(to_dma_dev(g2d->drm_dev), g2d_userptr->sgt->sgl,
-			g2d_userptr->sgt->nents, DMA_BIDIRECTIONAL);
+	dma_unmap_sgtable(to_dma_dev(g2d->drm_dev), g2d_userptr->sgt,
+			  DMA_BIDIRECTIONAL, 0);
 
 	pages = frame_vector_pages(g2d_userptr->vec);
 	if (!IS_ERR(pages)) {
@@ -511,10 +511,10 @@ static dma_addr_t *g2d_userptr_get_dma_addr(struct g2d_data *g2d,
 
 	g2d_userptr->sgt = sgt;
 
-	if (!dma_map_sg(to_dma_dev(g2d->drm_dev), sgt->sgl, sgt->nents,
-				DMA_BIDIRECTIONAL)) {
+	ret = dma_map_sgtable(to_dma_dev(g2d->drm_dev), sgt,
+			      DMA_BIDIRECTIONAL, 0);
+	if (ret) {
 		DRM_DEV_ERROR(g2d->dev, "failed to map sgt with dma region.\n");
-		ret = -ENOMEM;
 		goto err_sg_free_table;
 	}
 
-- 
2.17.1

