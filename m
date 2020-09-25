Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A42FA279111
	for <lists+linux-samsung-soc@lfdr.de>; Fri, 25 Sep 2020 20:47:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729772AbgIYSrR (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Fri, 25 Sep 2020 14:47:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37630 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729730AbgIYSrQ (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 25 Sep 2020 14:47:16 -0400
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0581CC0613D5
        for <linux-samsung-soc@vger.kernel.org>; Fri, 25 Sep 2020 11:47:16 -0700 (PDT)
Received: by mail-wm1-x341.google.com with SMTP id e2so4508240wme.1
        for <linux-samsung-soc@vger.kernel.org>; Fri, 25 Sep 2020 11:47:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=g/BH1U9GUunsIrnO/GbdPQWxTeH46s0MtJm8Rv2PmQg=;
        b=dRgYAI+Il/XnGvkuGcGG/lsBUKoJIpFGsPVq7bdfwYbSWBuKZWhEyZ/C6V2T06d7l+
         MlGVte7aAMEe5kn/Xzgvbo6wkmehHB6utltBuTWLjuy10bgK9jfUtimOpRmqNVZ/PDb7
         pPEsfddSQturiPpnwk/9j/tF8/GG+ViphzAqQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=g/BH1U9GUunsIrnO/GbdPQWxTeH46s0MtJm8Rv2PmQg=;
        b=UZORZ35SWDMTmGVIIPx3NTAaqGJOMHjK9AM39ogZ6y+qM4YwLPVUGUB8MlubDjPJfI
         TXTL0iOT/jnbUeU3y6IRbeGUwljPPfhpgKTaBWZ2OQJEkyDNgZ8Foyvcqdd0cdQ27/Ly
         /9vupOJHDnYY1eAahthZFXM9R1cIlXUCXNGoC9NqXa6qJka8QPtVNhaXMoEkrXn07lR8
         ZGtd+LGJMu1S9yt80S/5qc3ftwCwRP6eF6Nv5GTI9pTS3H0kG/DxeNWT25BtKX99jguC
         PStWpkrDHgHA8M2P2biuT1r/XC0xQMvqNOxc+UA8shzoty38BoeCm2lXqo22JXv5oZyB
         kRrw==
X-Gm-Message-State: AOAM530qjVO7Y4DNEaB0XD2Ep6+T6JQ0zf2nQkk6/lWOZdomq3ABbDFn
        ldOTXnNcFittcDyF0d1GrWInlg==
X-Google-Smtp-Source: ABdhPJwizv9lDNCgaSezSHmDHMwhCyQSsePLifiuaYRBnBvcSMHXRWloRU3D/0rZv64JO/qSChFcJg==
X-Received: by 2002:a1c:2d86:: with SMTP id t128mr4754086wmt.189.1601059634661;
        Fri, 25 Sep 2020 11:47:14 -0700 (PDT)
Received: from chromium.org (216.131.76.34.bc.googleusercontent.com. [34.76.131.216])
        by smtp.gmail.com with ESMTPSA id w15sm3841044wro.46.2020.09.25.11.47.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2020 11:47:13 -0700 (PDT)
Date:   Fri, 25 Sep 2020 18:47:12 +0000
From:   Tomasz Figa <tfiga@chromium.org>
To:     Christoph Hellwig <hch@lst.de>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        Joonyoung Shim <jy0922.shim@samsung.com>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Ben Skeggs <bskeggs@redhat.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Matt Porter <mporter@kernel.crashing.org>,
        iommu@lists.linux-foundation.org,
        Stefan Richter <stefanr@s5r6.in-berlin.de>,
        linux1394-devel@lists.sourceforge.net, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
        linux-parisc@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        nouveau@lists.freedesktop.org, netdev@vger.kernel.org,
        linux-scsi@vger.kernel.org, linux-mm@kvack.org,
        alsa-devel@alsa-project.org,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
Subject: Re: [PATCH 01/18] media/v4l2: remove V4L2-FLAG-MEMORY-NON-CONSISTENT
 flag
Message-ID: <20200925184712.GC3607091@chromium.org>
References: <20200915155122.1768241-1-hch@lst.de>
 <20200915155122.1768241-2-hch@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200915155122.1768241-2-hch@lst.de>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi Christoph,

On Tue, Sep 15, 2020 at 05:51:05PM +0200, Christoph Hellwig wrote:
> From: Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
> 
> The patch partially reverts some of the UAPI bits of the buffer
> cache management hints. Namely, the queue consistency (memory
> coherency) user-space hint because, as it turned out, the kernel
> implementation of this feature was misusing DMA_ATTR_NON_CONSISTENT.
> 
> The patch revers both kernel and user space parts: removes the
> DMA consistency attr functions, rollbacks changes to v4l2_requestbuffers,
> v4l2_create_buffers structures and corresponding UAPI functions
> (plus compat32 layer) and cleanups the documentation.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> Signed-off-by: Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  .../userspace-api/media/v4l/buffer.rst        | 17 -------
>  .../media/v4l/vidioc-create-bufs.rst          |  6 +--
>  .../media/v4l/vidioc-reqbufs.rst              | 12 +----
>  .../media/common/videobuf2/videobuf2-core.c   | 46 +++----------------
>  .../common/videobuf2/videobuf2-dma-contig.c   | 19 --------
>  .../media/common/videobuf2/videobuf2-dma-sg.c |  3 +-
>  .../media/common/videobuf2/videobuf2-v4l2.c   | 18 +-------
>  drivers/media/v4l2-core/v4l2-compat-ioctl32.c | 10 +---
>  drivers/media/v4l2-core/v4l2-ioctl.c          |  5 +-
>  include/media/videobuf2-core.h                |  7 +--
>  include/uapi/linux/videodev2.h                | 13 +-----
>  11 files changed, 22 insertions(+), 134 deletions(-)

Acked-by: Tomasz Figa <tfiga@chromium.org>

Best regards,
Tomasz
