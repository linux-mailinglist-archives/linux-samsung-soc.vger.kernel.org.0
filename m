Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B917295CBD
	for <lists+linux-samsung-soc@lfdr.de>; Tue, 20 Aug 2019 12:57:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729420AbfHTK5O (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Tue, 20 Aug 2019 06:57:14 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:43349 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729409AbfHTK5O (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 20 Aug 2019 06:57:14 -0400
Received: by mail-wr1-f66.google.com with SMTP id y8so11895692wrn.10
        for <linux-samsung-soc@vger.kernel.org>; Tue, 20 Aug 2019 03:57:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=98qjiU0RLQfpP+E/K7E40DkhQrUVY99Cv4VbFwpXIdE=;
        b=NZhc5g6Po0y7fipk5LSU9It+yU/8zmVLvWKenSr8A5F3380M4mvYyj7fAZsrQTxUbY
         MyLtrqnOvdOwpFZN0iQxUyVpMdJvqQOCiBNRVu+xrOUQCIFp/yfN/YQUZYiN8RmlFAvD
         d/QGouxgcqyNUxtNKwDnBcvm2SNoiNXukEXx6x6/rveKbOSvfBAOS/M3PYQojxg/lIMV
         nUxZ9Av6auRom3qUM1o5fRY3wdhp9GbPaZBB6KLnNNJQg2hBDUizjxNzBhUaozIeUxbB
         LZDgJD7Guo5b0M3P6j0k02pvGaH+UJptmi7cc0N/VLWTyF/OPb78dYwBv2IQnmfKVXM3
         WWMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=98qjiU0RLQfpP+E/K7E40DkhQrUVY99Cv4VbFwpXIdE=;
        b=W9dvyy/YUQAUG9mohXKQ+Imow26Iml4MblhXsWgDkoMPSj6F7I2Fgs9RQO7PUyhQnE
         X3CXhxme8DhmbVHqpqnxy96pbXVCKvo/laTTVf7goAkXGAQBAkKowlubjZnM+ZE/MagY
         6EcsL7XgTlHmQUkhbqASNbaolBCxnegg5TjBDcHKBgXTxOjMYPkcLst9UnFxzZMMlji8
         WsG8lLO0SAbaN+QXD/4XU7gGn16azLXWKpCg/PI8N6ccJUSgqtLEn7xs1HFtRqyAJ+NX
         l7YLGMRFd4pIzeO+u4GpP+HRlY24dI9mm46LGRWQBL3LTqoFKkctOiVCbzrZdzQxrDCg
         WTxA==
X-Gm-Message-State: APjAAAW1euFkO2/c8m19vUt9LOpCm2FBtIJa4sFexwaB6S3gYS8NByfK
        GW3aCyY8e4cDwhSHGDFvXzenmAVtpVFMuM5xfEiWKA==
X-Google-Smtp-Source: APXvYqwtnuJb1/oEfZ5NQaF7TnI6kZVMtvBJF3Qt67JpNEpW2p1RdqZeuoVk240AM/aFMrEu0lfmrSHQkg7q/kztwPY=
X-Received: by 2002:adf:9222:: with SMTP id 31mr18050325wrj.93.1566298631670;
 Tue, 20 Aug 2019 03:57:11 -0700 (PDT)
MIME-Version: 1.0
References: <20190819142226.1703-1-ard.biesheuvel@linaro.org>
 <20190819142226.1703-3-ard.biesheuvel@linaro.org> <CAJKOXPevJjBuRJjUX=6BfuMZSLUyqP3fpi7_eWDF170RfPvL+g@mail.gmail.com>
In-Reply-To: <CAJKOXPevJjBuRJjUX=6BfuMZSLUyqP3fpi7_eWDF170RfPvL+g@mail.gmail.com>
From:   Ard Biesheuvel <ard.biesheuvel@linaro.org>
Date:   Tue, 20 Aug 2019 13:57:00 +0300
Message-ID: <CAKv+Gu9Z=qkEVpkQYsCy5Q_EvMuQ1KzPVataWs+x4vhS_wB27Q@mail.gmail.com>
Subject: Re: [PATCH 2/2] crypto: s5p - use correct block size of 1 for ctr(aes)
To:     Krzysztof Kozlowski <krzk@kernel.org>
Cc:     "open list:HARDWARE RANDOM NUMBER GENERATOR CORE" 
        <linux-crypto@vger.kernel.org>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        Vladimir Zapolskiy <vz@mleia.com>,
        Kamil Konieczny <k.konieczny@partner.samsung.com>,
        "linux-samsung-soc@vger.kernel.org" 
        <linux-samsung-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Tue, 20 Aug 2019 at 13:24, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> On Mon, 19 Aug 2019 at 16:24, Ard Biesheuvel <ard.biesheuvel@linaro.org> wrote:
> >
> > Align the s5p ctr(aes) implementation with other implementations
> > of the same mode, by setting the block size to 1.
> >
> > Signed-off-by: Ard Biesheuvel <ard.biesheuvel@linaro.org>
> > ---
> >  drivers/crypto/s5p-sss.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/crypto/s5p-sss.c b/drivers/crypto/s5p-sss.c
> > index ef90c58edb1f..010f1bb20dad 100644
> > --- a/drivers/crypto/s5p-sss.c
> > +++ b/drivers/crypto/s5p-sss.c
> > @@ -2173,7 +2173,7 @@ static struct crypto_alg algs[] = {
> >                 .cra_flags              = CRYPTO_ALG_TYPE_ABLKCIPHER |
> >                                           CRYPTO_ALG_ASYNC |
> >                                           CRYPTO_ALG_KERN_DRIVER_ONLY,
> > -               .cra_blocksize          = AES_BLOCK_SIZE,
> > +               .cra_blocksize          = 1,
>
> This makes sense but I wonder how does it work later with
> s5p_aes_crypt() and its check for request length alignment
> (AES_BLOCK_SIZE). With block size of 1 byte, I understand that
> req->nbytes can be for example 4 bytes which is not AES block
> aligned... If my reasoning is correct, then the CTR mode in s5p-sss is
> not fully working.
>


I re-ran the kernelci.org tests with this change, and I saw no more failures.

https://kernelci.org/boot/all/job/ardb/branch/for-kernelci/kernel/v5.3-rc1-197-gc8809c50be4f/
