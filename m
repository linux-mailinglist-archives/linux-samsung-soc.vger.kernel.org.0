Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 01D502BAF63
	for <lists+linux-samsung-soc@lfdr.de>; Fri, 20 Nov 2020 16:57:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729946AbgKTPzI (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Fri, 20 Nov 2020 10:55:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:27269 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729941AbgKTPzI (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 20 Nov 2020 10:55:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1605887706;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=rY2Rec5SHAHV9d9Nn2wvBLT2el7uEj1Kc43gm3aG5HM=;
        b=EwJL05mPUm3n6YyKzsaGuY67v9GJ8cNLBhFVIx/CcaiaaWUXdHEcdBNGlaqLM4RSOcZ8Fx
        WP6/UfoMsecJ7luustqtS/zKled1lLYt0cjcuzWJ7AJ4iEYAIFA26++qCiVYGL+pRX7H+P
        AkwVWIc3qENm7P6ttAlq/d1px6yItL4=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-300-HmzBKNLuM5q0nSNPgK9WwQ-1; Fri, 20 Nov 2020 10:55:04 -0500
X-MC-Unique: HmzBKNLuM5q0nSNPgK9WwQ-1
Received: by mail-ed1-f70.google.com with SMTP id x15so3894323edr.10
        for <linux-samsung-soc@vger.kernel.org>; Fri, 20 Nov 2020 07:55:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=rY2Rec5SHAHV9d9Nn2wvBLT2el7uEj1Kc43gm3aG5HM=;
        b=Op2+V+FTE3ttXQquCqqJbw99SG+NYvm2ROEsbc2PEnqP8krSE2q07r2EeSttY2mAbA
         wxaBReid/tzGQt8F45IRr2+RfnKe0X54Q9MmBdzqat9FgiCkN68HgHUp6A57fFmWPXdI
         vaqHuU2XoTjTMJ7iGX+DEI8GR9pexZ+mii7BKmEOWDIAOMym3ojbKkkCcKMo9kAl6DMg
         4o2CoRn4Qd9ky5ymWDdsSlXkQASmOyl3GCocruIFuuZ8JofNjVfdvvXJ0MpNE20x5KeU
         nfJ9jlG+wLV5L9a3jIobpSx6wsTNxCJ554dwyXf09cxhK/Avxyz+G66R/VhoJU/W2YUg
         E12A==
X-Gm-Message-State: AOAM5306Kk60sFksWGjB5Dm564POKxsf1IHS5prhHqa0ScmvtykXSWqW
        0X1q36SaKeQQZXhovr7ymY6kpFMSzDK/NQm+yMxlnqxFr1wmHdIoXGM4R/nCimbIBHPfX+Oh9YN
        ZbWU3UxSqfCZmBirrIuiE1k4JlkCvJTg=
X-Received: by 2002:aa7:d2d9:: with SMTP id k25mr34928699edr.310.1605887702587;
        Fri, 20 Nov 2020 07:55:02 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw3gVlgwW/bmEajthpJVdpMUNtgPUbi/HFUtFVuvcpkMu9pSTRR3a9KC3tEdlGleoOWxNajPA==
X-Received: by 2002:aa7:d2d9:: with SMTP id k25mr34928681edr.310.1605887702427;
        Fri, 20 Nov 2020 07:55:02 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a? ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
        by smtp.gmail.com with ESMTPSA id r25sm1300693eji.8.2020.11.20.07.55.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Nov 2020 07:55:01 -0800 (PST)
Subject: Re: [PATCH v6 16/17] RFC: kvm: pass kvm argument to follow_pfn
 callsites
To:     Daniel Vetter <daniel.vetter@ffwll.ch>
Cc:     DRI Development <dri-devel@lists.freedesktop.org>,
        LKML <linux-kernel@vger.kernel.org>,
        KVM list <kvm@vger.kernel.org>, Linux MM <linux-mm@kvack.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
        "open list:DMA BUFFER SHARING FRAMEWORK" 
        <linux-media@vger.kernel.org>,
        Daniel Vetter <daniel.vetter@intel.com>,
        Christoph Hellwig <hch@infradead.org>,
        Jason Gunthorpe <jgg@ziepe.ca>,
        Kees Cook <keescook@chromium.org>,
        Dan Williams <dan.j.williams@intel.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        John Hubbard <jhubbard@nvidia.com>,
        =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
        Jan Kara <jack@suse.cz>
References: <20201119144146.1045202-1-daniel.vetter@ffwll.ch>
 <20201119144146.1045202-17-daniel.vetter@ffwll.ch>
 <cd56eb8a-fbec-e81f-9c14-d1256a193b68@redhat.com>
 <CAKMK7uHDrPDcsWyMgFgjf0+hdebSUT4hX5hKR=CnTH=soLU-Kg@mail.gmail.com>
From:   Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <3eca2dde-c78b-3eb4-8f61-7fdf16573419@redhat.com>
Date:   Fri, 20 Nov 2020 16:55:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <CAKMK7uHDrPDcsWyMgFgjf0+hdebSUT4hX5hKR=CnTH=soLU-Kg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 20/11/20 16:44, Daniel Vetter wrote:
>> It's a bit of a pity, it's making an API more complex (the point of
>> gfn_to_pfn_memslot vs gfn_to_pfn is exactly that you don't need a
>> "struct kvm*" and it's clear that you've already done the lookup into
>> that struct kvm.
>
> Yeah I noticed that, I think pushing the lookups down should work, but
> that's a fairly large-scale change. I didn't want to do that for the
> RFC since it would distract from the actual change/goal.
> -Daniel

Pushing the lookups down would be worse code and possibly introduce 
TOC/TOU races, so better avoid that.  Your patch is fine. :)

Paolo

