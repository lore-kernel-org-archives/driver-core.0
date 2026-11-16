Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794850650;
	b=Y6FA1i3yjewcB5X+4JFe94PbYqrg3VXUDRqi5jHVmKFRiIIhMsBeMmkHQT/0MaAxuxTO
	 4PwyLeD9UTt+s8u6xRCmQqOuhbgVsRxW2rg5gKmfu/+4RqH0g9TYrERqVVN/4Rs8yXYGN
	 NqM/XrjBeIm3+F+6d7HvTRzNsYetTxyIobe0+SVL1lWz1UiZz6v2UexjgZn8h1J5ODTwJ
	 PmaAxqyV63N+L3V3IUuCaoq9VGSDOIqo1WLZTkpPxSIit/EUthw5UPjIfKfDzaOWv97li
	 Yf6cMqTjNajhgakl9IJp6XMv2wk76ByMBj/JX0zWrDRi4WDD/RSflp/BslCPF7kWgIg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794850650;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=ASqD7yYrxwRTXpvky24aSldHzEJHTNv4OUWKJ01NHN8=;
	b=vQ/YeYWotR1CL86JlL1gDPyhNsx+B1jPpCSqvjrjK/Gal1bSOZv4uPEjJY5SwmQT4tvs
	 7V7uwCfu65aUw5PDOiN2wR1v64aUolAu64CPMz74P/ePX5uPUSeqiePRZ5cKyFGxi4NBJ
	 UHCFdQoD2gx6Zjoe6tVTyYvEsuasyYTnreci4F40jyoXJTen7vylRoY4Y3ryBlThBBjGt
	 4uc4wSNVF4qhnOcJ4HNb+INPo7KMMNbQAESCcz3YYubEYK9dl47nYAExSpXWs+o4kkbgl
	 mCaq8hDT+rGnaskJoGjZxzDvmQVdHK8GFMKgrkr90iYWf6FU51pB5q094cMuas1kNVg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MIIHDm6t;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.46
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F582606A88E
	for <driver-core@lists.linux.dev>; Mon, 16 Nov 2026 17:37:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4F582606A88E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MIIHDm6t
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6b81214ab40so218685a12.0
        for <driver-core@lists.linux.dev>; Mon, 16 Nov 2026 09:37:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794850648; cv=none;
        d=google.com; s=arc-20260327;
        b=CzAAn8ZBuvyvoAG/yAoG/SCvfKE6iGTwTDiGRqtSz004A1/tKh2ZcyEbG/IFv05Wym
         VXDuNYSldwdHf/G8TCGnz+pYPAxY9xf951xO3pwQXAaDSukGl9oFN48p1Z3QtZ9zD4Wh
         +LcajyfL/+dTGlzOhGh9ITrYUf2mjRanDcKLXR/PcpFcwXERAbXDppBBvedRVq4vlodr
         lKuo9dKuyuhEBpgQVLC9Qp6s/KCSu4syF7JdzCUt6COzq9xjHST48zKxZBJscHtz+Y8j
         y0i3xI9e9muPWhvGsEwwdm0MgxOcqsLOutwCwIV/KEluzqE6PP9+k6xGRiBXzBgeaVnA
         AfPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ASqD7yYrxwRTXpvky24aSldHzEJHTNv4OUWKJ01NHN8=;
        fh=1kojmfPdJumaxZsdkGBwP4FPjJkyPlvnBhqu1SfcgP8=;
        b=m0GTX+PVyh6fbuKKY72R8NMhl/ixUSO8emau8V4biJYNjnepdrxZ6nqoPb2I4eHmkb
         d0fpF5Z/KnCszXBEJnCX0gRUa5c9a5zuEzWZZflxq5ZQ3nPOqO+rb+N5HPjU922kIKt8
         PZGGSLEWBbaE667BfI73pQUurGxwQ5sQ/XZ1JQj2LxKDjGtCwa4jFabdfKKXsedBnNQ8
         Y2eqQm2auZeg5AcdfT4gO5dIL1lJr+qPcHkdtn69jDQyLsdXrgJFzEwrG3Vyernil7Sb
         NrSfF19l+TQn+8q6ZaVLupTk48RHhDZpqAQw6QNTDdeBkHZagHQNEzsTUuU3r/uJelhi
         iCBw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794850648; x=1795455448; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ASqD7yYrxwRTXpvky24aSldHzEJHTNv4OUWKJ01NHN8=;
        b=MIIHDm6tNl0jMwQGZFYspXzw69ZH9P9dqlik2bLwSZHN79vb9UQDq3BhLSBW5bLNnp
         kdIeVHGjhZHzf61SyL3b3ydlxwim4EjsThqb0fnZxnanBsxutaCIhyTlGBRG9hPSRbOZ
         fFaG5vsg41r3wTTij9drFm8gpxLl42CkbIANWuXryWOvdftgQB/8SBQEIjVn8KSPtYSU
         2vlHLos9zQsrpdhu2xI22Ez4Yub9+BznFJIQxI6j/wgPmjfKMw/Zc4e/dF3RGn2Ktq3T
         s21vwK591UvJv1ZlyUvhsPDv/2gU2Po7TGDNdkl+TDZ6z2h+AfFyVPIkrcGrM8jz08LR
         NM+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794850648; x=1795455448;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ASqD7yYrxwRTXpvky24aSldHzEJHTNv4OUWKJ01NHN8=;
        b=tV2DkrwIZCxRkyMupFiZDZJkQ0QErT3b0PN7AOM3gQwrlOnryxSGM2mdp2qCPcP2lF
         FNjLFdrS4vYuRwqS4IUE6oEwbrYG1/8Nklnx6jRLq7ykrmZrDX+0UADZxn6c/kh0h+XN
         HX/zSRh9TdK6Gyq/oH0osQ9y1H3c/LDPmzA5pn3OtRRpRUwGUK9B+2EEQSskv6zmbXst
         Uzo0O3c9NCcTf8zU6LGBu1WTC17bXSWdYpgV5ij6jqFE4aboPd/rbkVTg6Q3+jTz/p4/
         DOPa36KnnODAVwW7DsqjGwZGzYV10kDpnU8C81zrYDS3ImXjBGu+3F7kKXBwFJY7bQMc
         phSQ==
X-Forwarded-Encrypted: i=1; AL+hErELJOWjzR7YpT0uwlt2m8lpnRyrVbKXn06d1GX+Cc31F49CVDG0r6s+3FcHNfcZp+KRg/eZGQ+4lHUnLQ==@lists.linux.dev
X-Gm-Message-State: APuU4Z8E6RIw+R9t9QBqjdUNij8DYDcuVLSrablCEdF84DOOW5jh/BmS
	pDcyww2T84fiVo//oYYb/3CoBj69GWoeoRo0dVo0fryVg5ttqo+xsbEf/oCiEqqc59NUof1F5co
	v/684QWEXWkIQvtfrzqHDvKe/TKHwKfE=
X-Gm-Gg: AYBFou2zYIj0kYuGlDjSYvXzGCPC9ees0Roqa2N/QGjz11jV6PhY8oJiUhZPW30zKM/
	xGKrUr+AKJCKLvqvo9F2NNawHSghdWpLCk+dH3mwBaGOO3x8/+kO0CZJezh0HBIUxoGqzjC00sf
	cUyRgTeqPxTBr1MYSRWI8VA5tJf/ksR2bXZyM0vZzopC3Al9VHcoKlCUdAtdc3hOy4OxIZoYhXk
	GzlnNQLWWIdZjK/C4OJ/xBU9dZu+32uGLddlzCoPRqFyvIZrKVaLlnynayF5QwTnPmYf6Tlir2P
	+6qXnD9hI01scs/aLqojwnSH5Kbgs31l/gQBkCRq1P0c9yY72PACqnLntF8X9vNYlHRbOhWmF8z
	eXVxAFu3LZou2UXMEg3aejpwDe3sFvNWRIifnz+ExI5U/yqszeLbQaeUEtg7tHjBL4jWPpA==
X-Received: by 2002:a05:6402:1598:b0:6b5:7250:d621 with SMTP id
 4fb4d7f45d1cf-6b859ae1a00mr134291a12.15.1794850647426; Mon, 16 Nov 2026
 09:37:27 -0800 (PST)
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Post: <mailto:driver-core@lists.linux.dev>
List-Help: <mailto:driver-core+help@lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
List-Owner: <mailto:driver-core+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261116-work-loop-pseudo-v3-0-8cbbea1cf34f@kernel.org> <20261116-work-loop-pseudo-v3-33-8cbbea1cf34f@kernel.org>
In-Reply-To: <20261116-work-loop-pseudo-v3-33-8cbbea1cf34f@kernel.org>
From: Amir Goldstein <amir73il@gmail.com>
Date: Mon, 16 Nov 2026 18:37:16 +0100
X-Gm-Features: AclHuK_sKnxFPAK3k65pZhjyZC94SJD4eZ9z2j_P12s3kyb9TMw6hurQcjyq55Q
Message-ID: <CAOQ4uxgPerkkG4ie0SyHVXaBD9VZN2wYfQpEAEi4hytn=ara3A@mail.gmail.com>
Subject: Re: [PATCH RFC v3 33/44] ovl: refuse data-only layers on pseudo filesystems
To: Christian Brauner <brauner@kernel.org>
Cc: linux-fsdevel@vger.kernel.org, Jann Horn <jannh@google.com>, 
	Chris Mason <mason@kernel.org>, Josef Bacik <josef@toxicpanda.com>, Christoph Hellwig <hch@lst.de>, 
	linux-block@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-nvme@lists.infradead.org, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Jan Kara <jack@suse.cz>, linux-scsi@vger.kernel.org, target-devel@vger.kernel.org, 
	driver-core@lists.linux.dev, linux-mm@kvack.org, bpf@vger.kernel.org, 
	linux-security-module@vger.kernel.org, selinux@vger.kernel.org, 
	apparmor@lists.ubuntu.com, linux-nfs@vger.kernel.org, netdev@vger.kernel.org, 
	fuse-devel@lists.linux.dev, linux-efi@vger.kernel.org, 
	xen-devel@lists.xenproject.org, ocfs2-devel@lists.linux.dev, 
	linux-s390@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-usb@vger.kernel.org, linux-erofs@lists.ozlabs.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 16, 2026 at 12:10=E2=80=AFPM Christian Brauner <brauner@kernel.=
org> wrote:
>
> The data of a metacopy file can live in a data-only layer. overlayfs
> doesn't look that data up when it looks up the file. It only remembers
> the absolute redirect and looks up the data lazily the first time
> someone needs it. So until then nothing can tell which filesystem holds
> the data of such a file.
>
> But a data-only layer has no business being a pseudo filesystem in the
> first place. All it does is hold the data of metacopy files and the
> regular files of a pseudo filesystem are kernel interfaces, not storage.
> So let's refuse data-only layers on superblocks with SB_I_PSEUDO at
> mount time.
>
> Data-only layers can be added via the "::" separator in "lowerdir=3D" and
> via "datadir+" by path or by file descriptor. All of them end up at the
> end of ctx->lower. So a single check in ovl_get_lowerstack() covers all
> of them.
>
> Note that regular lower layers on pseudo filesystems are left alone.
> Stacking overlayfs on top of sysfs keeps working.
>
> Suggested-by: Amir Goldstein <amir73il@gmail.com>
> Link: https://lore.kernel.org/all/CAOQ4uxhGxpBtMZ5kfuzR1tQAewiecoX7UjXQRo=
91QjJHH9T_Yw@mail.gmail.com
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
> ---
>  fs/overlayfs/super.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/fs/overlayfs/super.c b/fs/overlayfs/super.c
> index 39d4d57dec230..719c2569dfeaf 100644
> --- a/fs/overlayfs/super.c
> +++ b/fs/overlayfs/super.c
> @@ -1237,6 +1237,14 @@ static struct ovl_entry *ovl_get_lowerstack(struct=
 super_block *sb,
>         for (i =3D 0; i < ctx->nr; i++) {
>                 l =3D &ctx->lower[i];
>
> +               /* Pseudo filesystems don't hold data for metacopy files.=
 */
> +               if (i >=3D ctx->nr - ctx->nr_data &&
> +                   (l->path.dentry->d_sb->s_iflags & SB_I_PSEUDO)) {
> +                       pr_err("filesystem on %s not supported as data-on=
ly layer\n",
> +                              l->name);
> +                       return ERR_PTR(-EINVAL);
> +               }
> +

How about we make this just a tad more restrictive:

                /* Pseudo filesystems don't belong in composefs setup */
                if (ctx->nr_data &&
                    (l->path.dentry->d_sb->s_iflags & SB_I_PSEUDO)) {
                        pr_err("filesystem on %s not supported along
with data-only layers\n",
                               l->name);
                        return ERR_PTR(-EINVAL);
                }

I could send this as followup patch, but since this version is simpler
there is no real reason to have the intermediate "only ban datadir" step.

Only the commit message needs a little more flexing to justify this.

Thanks,
Amir.
