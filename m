Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1D01A281A76
	for <lists+linux-samsung-soc@lfdr.de>; Fri,  2 Oct 2020 20:06:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388380AbgJBSGG (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Fri, 2 Oct 2020 14:06:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60128 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726386AbgJBSGF (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 2 Oct 2020 14:06:05 -0400
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com [IPv6:2607:f8b0:4864:20::741])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E32AC0613E3
        for <linux-samsung-soc@vger.kernel.org>; Fri,  2 Oct 2020 11:06:05 -0700 (PDT)
Received: by mail-qk1-x741.google.com with SMTP id d20so2357365qka.5
        for <linux-samsung-soc@vger.kernel.org>; Fri, 02 Oct 2020 11:06:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=+LaXP0gz54Jegk2Sj4FZgrVo6ri43ZoIhALcEdceV7s=;
        b=J7kgY6cwrb58DOoexGugRCEp3mOA3N2SuE3K7Vkq5DNITA7cVKmdZqs7c/H8mPlIXn
         o8UTppelOaWj/A+mIwckLvjSUAU505SsEF3y1UzB63e8RdNoL/7u/+lTbA+W+QbJg49u
         gjsGdY/ede4W2O1vArxPiL2+QKZNSLtPznD4UnaDnr+9U1NqECZIyPugGKiO/byu4Wsr
         ZiE32MDkyDjSRgUA3y85ay+ogHthqSIXcOgCRKKR9TEo8YPT5+VwXEqNByR4xXZxn6eZ
         DL3Xo9PmsQDfglZGmXIoeYvA5RBCHAUhpl0ys8t6dV8rIql31yOwXhGQ93xvBlsHWoj8
         tkUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=+LaXP0gz54Jegk2Sj4FZgrVo6ri43ZoIhALcEdceV7s=;
        b=GRTTjVH0MJ6eTIX9dFAdBoK8uFhy+tiQ9fESOLa/gmJmL9vrItvPYNZgNpfwlpaWcE
         qfXT9uNSn3Q4Tw1XXf+hvEafnveEAyXI9UzqZU3FL7E9MqlhcSxIGwLoMYmHuo/na6ce
         0LJW71M+7bZAwbjrzTm90fk4C2dxacyaZbR8xcpAPYcaTneK/yhjSZ2KaXwCfImoJ/Ug
         I4NNjie6UZn8YdWlGYMDghM0HhUOZr0z/wvQMNkYaCErNkBGaOW9/p/7jHo60eZsP9ir
         JZo01uRgo+viTwo1P6nddWNnbmAXdGNIgIa9CwRdWwaHYRF+VXWgnqm4AqgBBENRrl8+
         evOA==
X-Gm-Message-State: AOAM533lDRTeltk0DbZEat9nMuNSSTvTbXEbZCCn0C4BXvotOZX2mzIK
        pmTfyr2AvSFE3SbGGC+pfXuOww==
X-Google-Smtp-Source: ABdhPJxx4jEaLX4t/GDgPp9QrFZRDhny976xDexrly3ltPkHkc73Gz3CvOBBFQXoSMUgBgbH3LKfmw==
X-Received: by 2002:ae9:f70d:: with SMTP id s13mr3396635qkg.215.1601661964700;
        Fri, 02 Oct 2020 11:06:04 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-156-34-48-30.dhcp-dynamic.fibreop.ns.bellaliant.net. [156.34.48.30])
        by smtp.gmail.com with ESMTPSA id i62sm1604038qkf.36.2020.10.02.11.06.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2020 11:06:04 -0700 (PDT)
Received: from jgg by mlx with local (Exim 4.94)
        (envelope-from <jgg@ziepe.ca>)
        id 1kOPRT-006GH8-H7; Fri, 02 Oct 2020 15:06:03 -0300
Date:   Fri, 2 Oct 2020 15:06:03 -0300
From:   Jason Gunthorpe <jgg@ziepe.ca>
To:     Daniel Vetter <daniel.vetter@ffwll.ch>
Cc:     DRI Development <dri-devel@lists.freedesktop.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Daniel Vetter <daniel.vetter@intel.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        John Hubbard <jhubbard@nvidia.com>,
        =?utf-8?B?SsOpcsO0bWU=?= Glisse <jglisse@redhat.com>,
        Jan Kara <jack@suse.cz>,
        Dan Williams <dan.j.williams@intel.com>, linux-mm@kvack.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-media@vger.kernel.org
Subject: Re: [PATCH 2/2] mm/frame-vec: use FOLL_LONGTERM
Message-ID: <20201002180603.GL9916@ziepe.ca>
References: <20201002175303.390363-1-daniel.vetter@ffwll.ch>
 <20201002175303.390363-2-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20201002175303.390363-2-daniel.vetter@ffwll.ch>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Fri, Oct 02, 2020 at 07:53:03PM +0200, Daniel Vetter wrote:
> For $reasons I've stumbled over this code and I'm not sure the change
> to the new gup functions in 55a650c35fea ("mm/gup: frame_vector:
> convert get_user_pages() --> pin_user_pages()") was entirely correct.
> 
> This here is used for long term buffers (not just quick I/O) like
> RDMA, and John notes this in his patch. But I thought the rule for
> these is that they need to add FOLL_LONGTERM, which John's patch
> didn't do.
> 
> There is already a dax specific check (added in b7f0554a56f2 ("mm:
> fail get_vaddr_frames() for filesystem-dax mappings")), so this seems
> like the prudent thing to do.
> 
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: John Hubbard <jhubbard@nvidia.com>
> Cc: Jérôme Glisse <jglisse@redhat.com>
> Cc: Jan Kara <jack@suse.cz>
> Cc: Dan Williams <dan.j.williams@intel.com>
> Cc: linux-mm@kvack.org
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-samsung-soc@vger.kernel.org
> Cc: linux-media@vger.kernel.org
> Hi all,
> 
> I stumbled over this and figured typing this patch can't hurt. Really
> just to maybe learn a few things about how gup/pup is supposed to be
> used (we have a bit of that in drivers/gpu), this here isn't really
> ralated to anything I'm doing.

FOLL_FORCE is a pretty big clue it should be FOLL_LONGTERM, IMHO

> I'm also wondering whether the explicit dax check should be removed,
> since FOLL_LONGTERM should take care of that already.

Yep! Confirms the above!

This get_vaddr_frames() thing looks impossible to use properly. How on
earth does a driver guarentee

 "If @start belongs to VM_IO | VM_PFNMAP vma, we don't touch page
 structures and the caller must make sure pfns aren't reused for
 anything else while he is using them."

The only possible way to do that is if the driver restricts the VMAs
to ones it owns and interacts with the vm_private data to refcount
something.

Since every driver does this wrong anything that uses this is creating
terrifying security issues.

IMHO this whole API should be deleted :(

Jason
