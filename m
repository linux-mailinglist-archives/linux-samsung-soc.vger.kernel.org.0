Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 21B9B2C667B
	for <lists+linux-samsung-soc@lfdr.de>; Fri, 27 Nov 2020 14:13:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730041AbgK0NMa (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Fri, 27 Nov 2020 08:12:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49548 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729913AbgK0NM3 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 27 Nov 2020 08:12:29 -0500
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com [IPv6:2607:f8b0:4864:20::843])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 35BD3C0613D1
        for <linux-samsung-soc@vger.kernel.org>; Fri, 27 Nov 2020 05:12:28 -0800 (PST)
Received: by mail-qt1-x843.google.com with SMTP id z3so3162132qtw.9
        for <linux-samsung-soc@vger.kernel.org>; Fri, 27 Nov 2020 05:12:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=4mUb8VH3/zjOcaB0prxZNOCyhHeWL/oDXOLcVhlQukA=;
        b=QeSI7USzNR/Hc9luEaErhq6plcg4go9/B0jTyGRabKffYek2H3en767PronC7EqjDo
         tCgS7Jhbq/jTPd1JA2RC1+NR/OOvLrIacAkIJ8YKjPzi8TLM6jIUDyYleoGFJMsnGrIu
         IkwSC4rBqYzreESJdoFCcmxCf1KhL7Q804smgB8quH8Lf/75GJJiLoa5Nyr5e5mYAfKc
         BcJqfQSAdhbk0lurSwVxP1bn9QGb2WJl7XxF1jN6gZXVhgcnF3O6YoOPMR6yE6JH8Sn7
         ++ZYzAAOIahg0CheN04AL1LTyUHtoiYaRgOesk1MY6c0vUqUuhIhc2liMY8W6WQhHlvA
         76tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=4mUb8VH3/zjOcaB0prxZNOCyhHeWL/oDXOLcVhlQukA=;
        b=r7LNsS+WlFe5kW5mgbuoTG6tvol0qhVOPOgBRqSnRZjbZu5RLrFguHnZ7FHz49BHJP
         lkRSx+0Jmz7MPeMi+yVwzwJH5SQ9iS6NgfwoIAwf8SsQ+ghfE2fHN5d7rddGrMyZABAF
         92KShKm415fv022KuPEuiMRzEashAOdLXMZH9CbE1JhWc0TAMATcshZ8vQGbMhUPgkLB
         IvDZdVEbcXoeFARbz9YQZJsK6lMRDtL6zl2igANI9UxPXPfmXuBslwN79c1Dwe6+nmEw
         8CowglCnYxm9WdpwgIcpIGDtX2eYBOru3WY+paQ/F/A39+VG8HF51iMN8haXgf3OcrC5
         wNaQ==
X-Gm-Message-State: AOAM530n6/PuEoE2gTHZSSrmUKG0pmulIFvzIhTlmYQddYitaOk+7Hqa
        y2hJ2/14yaTGK3Ds0bD3O6DQlA==
X-Google-Smtp-Source: ABdhPJwdT9CaiC8171EVRdtYjL9xHQSUnZ3qtSTbobXQaW4gNhkgGlUa+eUk68y2VsuHP79oL1WzOg==
X-Received: by 2002:ac8:130d:: with SMTP id e13mr8308084qtj.3.1606482747424;
        Fri, 27 Nov 2020 05:12:27 -0800 (PST)
Received: from ziepe.ca (hlfxns017vw-156-34-48-30.dhcp-dynamic.fibreop.ns.bellaliant.net. [156.34.48.30])
        by smtp.gmail.com with ESMTPSA id t205sm6026453qke.35.2020.11.27.05.12.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2020 05:12:26 -0800 (PST)
Received: from jgg by mlx with local (Exim 4.94)
        (envelope-from <jgg@ziepe.ca>)
        id 1kidY1-002Xfv-SN; Fri, 27 Nov 2020 09:12:25 -0400
Date:   Fri, 27 Nov 2020 09:12:25 -0400
From:   Jason Gunthorpe <jgg@ziepe.ca>
To:     Daniel Vetter <daniel.vetter@ffwll.ch>
Cc:     DRI Development <dri-devel@lists.freedesktop.org>,
        LKML <linux-kernel@vger.kernel.org>, kvm@vger.kernel.org,
        linux-mm@kvack.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-media@vger.kernel.org
Subject: Re: [PATCH v6 00/17] follow_pfn and other iomap races
Message-ID: <20201127131225.GX5487@ziepe.ca>
References: <20201119144146.1045202-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201119144146.1045202-1-daniel.vetter@ffwll.ch>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Thu, Nov 19, 2020 at 03:41:29PM +0100, Daniel Vetter wrote:
> I feel like this is ready for some wider soaking. Since the remaining bits
> are all kinda connnected probably simplest if it all goes through -mm.

Did you figure out a sumbission plan for this stuff?

> Daniel Vetter (17):
>   drm/exynos: Stop using frame_vector helpers
>   drm/exynos: Use FOLL_LONGTERM for g2d cmdlists
>   misc/habana: Stop using frame_vector helpers
>   misc/habana: Use FOLL_LONGTERM for userptr
>   mm/frame-vector: Use FOLL_LONGTERM
>   media: videobuf2: Move frame_vector into media subsystem

At the very least it would be good to get those in right away.

>   mm: Add unsafe_follow_pfn
>   media/videbuf1|2: Mark follow_pfn usage as unsafe
>   vfio/type1: Mark follow_pfn as unsafe

I'm surprised nobody from VFIO has remarked on this, I think thety
won't like it

>   mm: Close race in generic_access_phys
>   PCI: Obey iomem restrictions for procfs mmap
>   /dev/mem: Only set filp->f_mapping
>   resource: Move devmem revoke code to resource framework
>   sysfs: Support zapping of binary attr mmaps
>   PCI: Revoke mappings like devmem

This sequence seems fairly stand alone, and in good shape as well

My advice is to put the done things on a branch and get Stephen to put
them in linux-next. You can send a PR to Lins. There is very little mm
stuff in here, and cross subsystem stuff works better in git land,
IMHO.

Jason
