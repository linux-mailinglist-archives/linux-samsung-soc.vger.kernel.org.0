Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6E17D53ADD3
	for <lists+linux-samsung-soc@lfdr.de>; Wed,  1 Jun 2022 22:49:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229486AbiFAUmf (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Wed, 1 Jun 2022 16:42:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38726 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229526AbiFAUmd (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 1 Jun 2022 16:42:33 -0400
Received: from mail-oa1-x31.google.com (mail-oa1-x31.google.com [IPv6:2001:4860:4864:20::31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2441025DFAB
        for <linux-samsung-soc@vger.kernel.org>; Wed,  1 Jun 2022 13:23:12 -0700 (PDT)
Received: by mail-oa1-x31.google.com with SMTP id 586e51a60fabf-f2bb84f9edso4187821fac.10
        for <linux-samsung-soc@vger.kernel.org>; Wed, 01 Jun 2022 13:23:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to;
        bh=Gk4nfCem3ECRa7Gml0J0mN/3RZoOAdfGaQAqyHPKtiI=;
        b=HLFKV03IvnCnmYNulbqEkPjTK3riUL87h2wHAPtiQ15M9iY6Q8e992KMQxJwLdk6f+
         yc6asPWVRklcz8AY8oqwyi19SO9Z3FXfSKl8KIcHwdn2diZ16fcVN3Noj9XYHhxCnXOp
         L86c6aBumcYcai1ti0jT0anzEO5LqUJSpP7KiFxQXIe3O9qnWY7viJfSABa1ly9ubc5O
         7xqU4M/fQQEbpLLu8u6cCuAo0xRfp/5LoTJYIMP5ne/O4VXGwgI3hKlV02ue3fdzqvYA
         6IABKhDngCz8ZKTuipfv5GZ/7HEqJFbM8x/u/85qQFiKTPs+Mb3XRU84XoMrlsTu1Zr+
         PsMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to;
        bh=Gk4nfCem3ECRa7Gml0J0mN/3RZoOAdfGaQAqyHPKtiI=;
        b=BZplhuOvzK964QKkB+4vEQpFT6umN+Fd/9KpsMu27yZiEOsqjf4Xe8ejrkPxhNBBsd
         l7XYOVf5kqRiJcFW/OKe/QXxqAlYRL6fskkkFBSOn6K9r5ZewXjz36ud9tiJ1MWY+TqK
         Wc4F1qwXMp4Pa3nOgleYlf/pufd+zyNOIrBJvSWF3HnVaWscKczOjz3XUsLshtsaOZcn
         vTpJvZwnM2qijIPkdHjMFIo6wKhzssvwwfVBVYwjvkmiZ1X4FNuGS3ml43NMjpwnUzyF
         /cQ1G5ZnV1mIgQjpeq/T7prMdQW+BjwntCMHugAh5oZQC4c3wl4P1V6Fh7Q+CfyUmmMH
         feRA==
X-Gm-Message-State: AOAM533zX/wzIEDt8EENX9gqPkaimunV5K3XJZ4aLjhwgZXyI79SEbVm
        9x4lZVGOnIzN9WtBb5OJc9dgDYAEKJJp9swoOL6Igm+jooY=
X-Google-Smtp-Source: ABdhPJzieEZsH3sz7p7h/CGCrygaKC3twss2VqEDgMRTw52PjXyF0yZxDsfC/Wcw+CTWK4gcBihtpQQBph7O0cnThRw=
X-Received: by 2002:a05:6870:308:b0:f1:ddfe:8ac5 with SMTP id
 m8-20020a056870030800b000f1ddfe8ac5mr16670934oaf.237.1654111051378; Wed, 01
 Jun 2022 12:17:31 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:6358:3601:b0:a3:2139:251d with HTTP; Wed, 1 Jun 2022
 12:17:30 -0700 (PDT)
Reply-To: johnwinery@online.ee
From:   johnwinery <alicejohnson8974@gmail.com>
Date:   Wed, 1 Jun 2022 12:17:30 -0700
Message-ID: <CAFqHCSSUC0MpbjYK8d-GCxOG4b6Qbk2uH3+xQDZte6cPBsxLGA@mail.gmail.com>
Subject: 
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Greeting ,I had written an earlier mail to you but without response
