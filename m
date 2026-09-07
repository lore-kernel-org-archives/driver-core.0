Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63F214A8A39
	for <driver-core@lists.linux.dev>; Mon,  7 Sep 2026 13:31:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788787894; cv=pass; b=eBsuDMefmd1QpSy0j1hUk0DtCTyEpJC/dTAp+IEMz4iRxFutHy1Iyi7s2V/cHyyv70Hl4VugMpCF1zSEl7ylUs52TJopCMhKZxQF08XaRuKrEkoPrWsd6E2SLLkvj2eXzFZwaaekbjtXXd8/0XyLUD8cW8hOj8Tr9gndDg4yT4M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788787894; c=relaxed/simple;
	bh=D1wAsx4CR5aOXpjyMVJB7sUcHL24GlLysdFmwnbPMG0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fYZzrbd1o/T3PDF8EyV7Z7LurDTUUZ8m0Ap+zZR2uRYwh34i+nJWqeS4l4TRICqQCVeqD+zOAH8wDVU1CytcqRQfn5wnkQ+6DkwWf6CIRGKbVLhMm7pCvcvO9v80Sjl9AqIrYwks5CEy/e06XMjsNW1pwjkUoyamgKedSuA8QQI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=a1nM3Sb6; arc=pass smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="a1nM3Sb6"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-482dbe4d247so2021718f8f.2
        for <driver-core@lists.linux.dev>; Mon, 07 Sep 2026 06:31:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788787889; cv=none;
        d=google.com; s=arc-20260327;
        b=GBKsLMHDN5UQQIHXQ8bjIWVmBb6EXEdT+firbVYSyhOCvI+wHuXly0B6V/UaQwjawg
         dm0YVMTVgMA0Pc7o4c/W/UKU3TfXFqP0KQcgh9+13IcOG5JRl2ASy4Si6f+DkfukoJZt
         asp3T5UIXwYeIbfESA99brueWUODZysvKYr8Ig8NF2nQtSPUdZHUvgD7ubm0WLQ7TVR3
         1asCzKZ6Xc+dMpcb5eqcIUvftyLZIVRwTJxKzJhfoo/Q1WBeCcufHsSWtDPU/wL6Rn/4
         kTmXYnh6+YRvYXrobOtDMw32WKby7kYJ6V2MI1YDa+k8iPgiJwvJbxVddpDal63L2WlD
         +kHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=MeIqMgyiOqWe7HQD7SmKTKpkW52D9bvAC89kO8GNV9I=;
        fh=P1JYhA8XYEBm3CMBLOHfCMt93FrOzMhSZkylpKL7IqU=;
        b=RNiXDKZP791fi+GHLjvYSE38zTj8m2JR1532fU4bBVpf/cJOePFcHc1TS1V/D2G1rJ
         Dv3FiX+S7H2eSXty1RlyEQOwCfZ6UN2lxuUNJlgIEfbkTphldcx5eYm2PdJf0w0PKqi0
         UGujsWNEJEbGuuEjLGffjy8xwK9f3PKmV3JNvoW23y/w1Zd2ckhOlhm/3Xndf8WiNgpI
         7Cp1TrUhf8+KAAQZEYGSF915gmDEUnhmaCMrUOJptP2SSFwxSMscXrEsiC6uB0T+43uf
         WTo8Bil7t4OmrDh6h9Ds49tkqqTvlHP4EkuotDetAXi/s1kdhbZhsKtFQAZYUTRv5nrd
         k61w==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788787889; x=1789392689; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MeIqMgyiOqWe7HQD7SmKTKpkW52D9bvAC89kO8GNV9I=;
        b=a1nM3Sb6iauPosPR2o5PIv4GBrxw23hdeex1QQJi27u+1ThN5ORB4JuCRZIWjGEHyf
         6qDGvmpr4ckDqAS8eh3zyLVDztnn0gdnuYp2XBteauuZbcuskG278ZA22q1VyxTIabLz
         RE2XrAWCsUku5g8xBuQFURdcR3LOf1oWhhTsZt5+JtdCioC21DDLscEzaU2BY3twVRvH
         eC3R3WurswESyTHUL9HAdgQDTcrero18lXXDm0K6yO5Xsp+M40aHgVyK0SjNV8QwAP/G
         BeMnbE6i1xGbJZBMSBpqwLN9pXRuCMnKSmuzg+jZaVM2f8umdAFCLRlsZ3dK4FyVfPM/
         gATQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788787889; x=1789392689;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MeIqMgyiOqWe7HQD7SmKTKpkW52D9bvAC89kO8GNV9I=;
        b=Cb/rdE9qoaR4X/vDm7h1ZlnRKTWiiS5n/8O32BJpqKX0jt+gdAwmNczL47s+pADkmw
         43cBi+0aRdl9/E+uK41XstNAw1MTcthl+yUdsfCzuCQHRElhgUzXu3Q/qYcWP0fEKVn7
         yxVkchWG7Q61ylvRQPuPigv8pc+ZLJoOlstKOxzMFVexgW8Q8lrVDSW+wwzHUp91ETGv
         7a5fhcrF71UHr2EfpRWZUrUohuGuMRQ/0thg1arL0Am5FghSxASG3+qjXHoZxXTab0r5
         956FWbBJggk/RAd2GkhprbmTLcDIh+B+GyI2NmbHZbUPzhsYgcwYNsPV+r21OFsrYogp
         3U1A==
X-Forwarded-Encrypted: i=1; AKwUvBwNZaevtU0+gA1vrHICIQXK+RJJENLQlfhLwhLs5MgYqicSspxT/zwiwfxVnLtx06ra9bdmbz30RAnE1g==@lists.linux.dev
X-Gm-Message-State: AFuF++nRsiH4WhsSAsav9MCjPaKi+3hXWyRPI5kIHSpk7NDzNtSqhSZb
	pJZ0EHDsYYnT6EEGyinaIAlxVshGRqJexysrI7ifkILw4LAzrkT/twEpbwtrCwtE62G/3HyXcyK
	ERrXSMSaJnf5LWPd7zTIvkZk3HjavwyCRY9JUK0V2
X-Gm-Gg: AYBFou3HBqjGjDif3czWimv8U0b3ksfaaYyaewo0u54Wwb5Ql7LJczFFCc495/IPnkZ
	js62KnhWnOhuKskidiNWDVSrl548vYigpjktGPupbaBxWDBNrdS0S1ACsnkKNzNZ3zzZ80pr3rN
	2LEFBzG/iqinsQnqVpUQpPQSHFd4Z2MRGjCMHfxzLWwrvmSaOCNs1YSWtmFvcC8ZtvGB9yPJ79u
	w1zsMrE1dXE/9p1lVaG5L/hvINsB+6h1AhKV8Pg8ETbWLMPNSB4hV+tdrX6FQcvD67s3FTqNUXu
	o6bUT6PDC6Kb51aFaKpQ2vwn02mKXMhhcjJnAfJKRW+6HJUACVaNyO9qu7lnFFMQZHRgF7H/Uzp
	ce4UopjEt/5SGQKgL2zqhAoNJ2Z7bGKwlmB4asOA+cw==
X-Received: by 2002:a05:6000:26d3:b0:485:8393:2176 with SMTP id
 ffacd0b85a97d-485870902eamr40614985f8f.21.1788787888668; Mon, 07 Sep 2026
 06:31:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260824-unique-ref-v20-0-490735672187@kernel.org>
 <20260824-unique-ref-v20-4-490735672187@kernel.org> <ao2WubjLtDuHvRzx@google.com>
 <DL894TFXM5AT.2QOXN683UKXIF@garyguo.net> <CAH5fLggAMfBcxprKJxs4JbieKadC_mKg4B0xNETOH1QUi72UGQ@mail.gmail.com>
 <8733vlxmm8.fsf@t14s.mail-host-address-is-not-set>
In-Reply-To: <8733vlxmm8.fsf@t14s.mail-host-address-is-not-set>
From: Alice Ryhl <aliceryhl@google.com>
Date: Mon, 7 Sep 2026 15:31:16 +0200
X-Gm-Features: AcwNN1Umd_wQEAUZHPYxidNRM70dkjd7WtcOMgQxK1KjbblodnsY1lRpQ3kHiGM
Message-ID: <CAH5fLgjEfZO9DwcUxaKCWd_hFUrXU+cxiwmRg1UnM2pKD6gPvg@mail.gmail.com>
Subject: Re: [PATCH v20 4/8] rust: page: convert to `Ownable`'
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Gary Guo <gary@garyguo.net>, Danilo Krummrich <dakr@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
	Vlastimil Babka <vbabka@kernel.org>, "Liam R. Howlett" <liam@infradead.org>, 
	Uladzislau Rezki <urezki@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Lyude Paul <lyude@redhat.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	=?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>, 
	Todd Kjos <tkjos@android.com>, Christian Brauner <brauner@kernel.org>, 
	Carlos Llamas <cmllamas@google.com>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Dave Ertman <david.m.ertman@intel.com>, Leon Romanovsky <leon@kernel.org>, 
	Paul Moore <paul@paul-moore.com>, Serge Hallyn <sergeh@kernel.org>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Jan Kara <jack@suse.cz>, 
	Igor Korotin <igor.korotin@linux.dev>, Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>, 
	Stephen Boyd <sboyd@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Pavel Tikhomirov <ptikhomirov@virtuozzo.com>, Michal Wilczynski <m.wilczynski@samsung.com>, 
	Ira Weiny <iweiny@kernel.org>, Philipp Stanner <phasta@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, driver-core@lists.linux.dev, 
	linux-block@vger.kernel.org, linux-security-module@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-fsdevel@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-pci@vger.kernel.org, 
	linux-pwm@vger.kernel.org, linux-usb@vger.kernel.org, 
	Asahi Lina <lina+kernel@asahilina.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 7, 2026 at 2:38=E2=80=AFPM Andreas Hindborg <a.hindborg@kernel.=
org> wrote:
>
> Alice Ryhl <aliceryhl@google.com> writes:
>
> > On Sun, Sep 6, 2026 at 3:02=E2=80=AFPM Gary Guo <gary@garyguo.net> wrot=
e:
> >>
> >> On Tue Aug 25, 2026 at 2:20 PM BST, Alice Ryhl wrote:
> >> > On Mon, Aug 24, 2026 at 01:17:56PM +0200, Andreas Hindborg wrote:
> >> >> +        // SAFETY: We just successfully allocated a page, so we no=
w have ownership of the newly
> >> >> +        // allocated page. We transfer that ownership to the new `=
Owned<Page>` object.
> >> >> +        // Since `Page` is transparent, we can cast the pointer di=
rectly.
> >> >> +        Ok(unsafe { Owned::from_raw(page.cast()) })
> >> >
> >> > This doesn't satisfy the safety requirements of Owned::from_raw()
> >> > because the page may be used with vm_insert_page(), which increments=
 its
> >> > refcount and causes it to be shared the vma system, and this occurs
> >> > before Page::release() is called.
> >>
> >> I suppose the existing vm_insert_page() abstraction we have is already
> >> problematic, because it uses `&Page`?
> >>
> >> Maybe we want to change the API to use `ARef<Page>` so it already has =
to be
> >> shared? Conceptually it takes a reference count from a `&Page`, which =
isn't
> >> possible because `Page` is not `AlwaysRefCounted`, so it needs a `&ARe=
f<Page>`
> >> to be able to do that op.
> >
> > Honestly, the problem is the safety requirements of Owned::from_raw().
> > Pages have a "special" main reference, and free_page() does more than
> > put_page(). It even does something when the refcount does not hit
> > zero.
> >
> > The correct behavior for Page is to allow the user to hold one
> > Owned<Page> whose drop calls free_page(), *plus* any number of
> > ARef<Page> references that invoke put_page() on drop. This way, the
> > owned page controls the special drop codepath.
>
> This does not mesh well with the model of `Owned` behaving like
> `UniqueArc` to `ARef` behaving like an `Arc`.

It's a different case, I agree.

> Please help me understand; with page having a main ref and an auxiliary
> refcount, if we model that with a single `Owned<Page>` and a number of
> `ARef<Page>`, what would happen in the case where the main ref (`Owned`)
> is dropped first? Is this legal?

Yes, it's legal.

> My intuition here would be to follow Garry's suggestion and have
> `vm_insert_page` take an `ARef<Page>`. Can you elaborate why this is not
> an option?

That would be the wrong ownership semantics. The C side increments the
refcount rather than take ownership of a passed-in refcount, so the
correct argument type is &Page.

Now, for the use-case in Binder I believe we could switch to
put_page(), as we don't need the extra stuff from free_page(), in
which case we only want ARef<Page> and do not require Owned support.
But as long as we are calling free_page(), it needs to not be
clonable.

Alice
