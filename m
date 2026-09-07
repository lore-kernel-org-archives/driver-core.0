Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BE7C448392
	for <driver-core@lists.linux.dev>; Mon,  7 Sep 2026 09:24:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788773079; cv=pass; b=MeW8JYiR1R1UiWsBkLB/St6U45oF4vCPxXTX26AvzXx1cbUOaYlSR0C3CPahQtLkzFlRRvoUijEFxkDG/BDLYvVwSW2aHYgCHCUvBTDN72yL01y0rG/oFBJD8Z+exOPBSOPIHhdbaQ2uNCEx50uuTyJH/Edo7XCbSbUmDY8MKSE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788773079; c=relaxed/simple;
	bh=cSfmMGgIFwjjaaI7Bk9duU/SsMv1zgWa3X4ow3p9Z0U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KU8RfTaGEiKFuH21zYwqVvFj/HXO54ClMLJLv5GGRVlxFYl3sxbXySK3EMupr1xjP8leFVsLnvgBu51YfnHnqpmZLBVpse4S72pArGrth4Ug2mV4tXDBQJNj1eZcO1ter/sd0F6PTFfiZVrNPF+HxEJ4k/omXe+vVx0zpufHWh4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=jsy8/jqM; arc=pass smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="jsy8/jqM"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-482dbe4d247so1864631f8f.2
        for <driver-core@lists.linux.dev>; Mon, 07 Sep 2026 02:24:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788773075; cv=none;
        d=google.com; s=arc-20260327;
        b=UKxNLMofIHe4cvXDWma01g+VX0Det/zDyPwvhVSu+8WMjSHHh1mhMd206Dg4ako/ez
         xcoMZkOwy5CYGxz6PkWQRIK2UxRkF5fhIlqCpjQ2isc6VvD3G4bP9217UJ+hUx2f4Qet
         2wFXRUr1S9HDBa5SQ9oP/Ns3ZLFoSgyLT6uSA5PmkoFE7WQ1/Z57MIIl229cE45U+X3/
         HRhUKrTIb4lfqctT0u/dPUuPYZgk67gbxCXTxke1QoB457zOm4xmMq7wDHHBrN47csUH
         62o5/FcDy0oMs+GglE91iUEp0NE2eC7GLJVq08nLjGE3uQN1OyqQAKxEBYDX3RdSyI2s
         8UMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hfGjfP8T35WEV6rGIAsKY4f5Rwo6my7dAG0voowddxQ=;
        fh=K9pEM5HuwPTXgK0tJot7R6MPxsWBjG29pEyXleM6tZc=;
        b=F5FSZTwIBHlXVddeFyBM/KPZGx52Xlu5pGSqQ+NgUlE8x131bGrWMTpgxBNw8eDuky
         j6LnDh/eig2HqBzKDFOXIojvW4CSl0lDq5f34yF3G+DgwGkZfbcXsVT9IhhAm0mXvaX1
         8wRYAKE+MlVlntnml2lCSXxLsDvaBYeJV+VHe29S0BkGrXKR+0ES/ry12F7IpTZsgg4C
         tBhBQvT9Crpg8EGL/8QVg4pYTr3RUchobL2ToTu9g4axuGpOU58ZwQVbm4UP2C4OAuZ1
         zuV0YnyDKEv0F1bjdKUJDEJOr5qI6r3Ri6bVnu+t7LIsCT1A6bQ+j5XOEU7UCbnBRGfU
         wm6A==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788773075; x=1789377875; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hfGjfP8T35WEV6rGIAsKY4f5Rwo6my7dAG0voowddxQ=;
        b=jsy8/jqMDxWtuS3bmyTOju9PIVNCZQvY1Ul3HJgGrex2GIT5uN/kQ9CfVWUzb9uqHO
         3OkDqoybBHwVvD+8oxIZ5RC6idfODoLz4m1o53X6H0RE/3HQoqlIjlP6k7OKSMwnUCiA
         jMYFXJR0uKyFLsMUCr9uqTKkEycywWkrGN29Yj0fdaZiTvCZOdEimW9Qh8/dGqKMR6c3
         wMH8tD+1LwPOqM8eSl0pbmYhzlLC0mypk0fIwM/nvd/DJadCa1hjz4WA6yzUAeVQiPT2
         XcCybNgi2wtiCB5CzjcdZPdLU4pSkd4DQ+f4ez3AeK/Qj3I+sv4/hpTDK9eeab30ffF9
         CKeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788773075; x=1789377875;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hfGjfP8T35WEV6rGIAsKY4f5Rwo6my7dAG0voowddxQ=;
        b=P8rmpAs7XzshymodifwTTJfXyq3uAA0N2/54IvE5EKHwymZ6QsGPob/yJ9+IvjCF2n
         i0PEufrz/HQUmQ39PYosugpDOsXBuAgZULejSTjldiUsvLFf2dskfFin+C6OG7LmJRAZ
         DWycBymDTM6rcGRIbhHqFHUe1Z3B5zXkHLK29eA62bm1kk4yegnpi6opaUWv0SDlbKUv
         agbYMY39pn6gv63ch7+q08M1HgCgjWDeMDsdGjxcC8f0acUm5hk1U4FfcvxkNkQE+f0E
         3tsVpxwzii2el4S7X6mmTU0yrx1P/BuiScsq0ICEm9JjFD8xaBIvzGs/1zQYUbnV/Kba
         drkw==
X-Forwarded-Encrypted: i=1; AKwUvBynX47Ym08qVI6JBS+Nb7exTiy3jP9SHuNWiLMbwoDix7v9ilBuwHC5CKJVtDcgE+NrWNSGZTEDF+6dLg==@lists.linux.dev
X-Gm-Message-State: AFuF++mZUh/Y64nV4AMlJCCGnspUHwTF/c4XyUTUZ1gcUJ3EWbNygbqX
	3S5TTM/Jb5Rm0S7OZgpNH2UI/lEUOo3t4s0WMztL6gK/WZQIFKr5gGdU7J4lOxNC2V/+KEehJFX
	bOnarKguc5I229KoPmsKP+5XTLOL5Ug7gu85viJ/I
X-Gm-Gg: AYBFou3/Xc/vmuqC6iBNOBroyeENBKoDvnyMUy6c1348Gvi6OWGb7KRA2JfRiPkm8BE
	J6Fw4G6IU4pkcLRgxXIqkAt50WRQplRjAuo1223hPirfzhwyj9erld/wwlIeq8lQx9VLv2bQV+U
	w+uG9cvPE06fJWIdBq6/hqsK1n7380L/gs6MQgMKksG0M1xdel1asT4H94CLPRop0bZnqoICre3
	aBJIO1+ttjTSFszrOfdeZFOOeeOFNvjEKbOR0Lpyb+CHlgt4V+NVH72fswOGs18om8vsTGnUXfc
	1srSUjRNw3MrDYznV/bJrqetQQyPGLab0oo3UhzcOeGMDGWZ/gVsefDj6O11sRio1bH5fd5kBKC
	YRd7N59siSmMQijCL6RMYiekCN4ExOSo=
X-Received: by 2002:a05:6000:430b:b0:485:8ad6:3752 with SMTP id
 ffacd0b85a97d-4858ad63a6fmr37026021f8f.5.1788773074197; Mon, 07 Sep 2026
 02:24:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260824-unique-ref-v20-0-490735672187@kernel.org>
 <20260824-unique-ref-v20-4-490735672187@kernel.org> <ao2WubjLtDuHvRzx@google.com>
 <DL894TFXM5AT.2QOXN683UKXIF@garyguo.net>
In-Reply-To: <DL894TFXM5AT.2QOXN683UKXIF@garyguo.net>
From: Alice Ryhl <aliceryhl@google.com>
Date: Mon, 7 Sep 2026 11:24:21 +0200
X-Gm-Features: AcwNN1V4plkowyMHAsnIxTQwxzR-aYAz331pg1N8okzwNx7uKX70uWh-YG4Yx6I
Message-ID: <CAH5fLggAMfBcxprKJxs4JbieKadC_mKg4B0xNETOH1QUi72UGQ@mail.gmail.com>
Subject: Re: [PATCH v20 4/8] rust: page: convert to `Ownable`'
To: Gary Guo <gary@garyguo.net>
Cc: Andreas Hindborg <a.hindborg@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
	Lorenzo Stoakes <ljs@kernel.org>, Vlastimil Babka <vbabka@kernel.org>, 
	"Liam R. Howlett" <liam@infradead.org>, Uladzislau Rezki <urezki@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
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

On Sun, Sep 6, 2026 at 3:02=E2=80=AFPM Gary Guo <gary@garyguo.net> wrote:
>
> On Tue Aug 25, 2026 at 2:20 PM BST, Alice Ryhl wrote:
> > On Mon, Aug 24, 2026 at 01:17:56PM +0200, Andreas Hindborg wrote:
> >> +        // SAFETY: We just successfully allocated a page, so we now h=
ave ownership of the newly
> >> +        // allocated page. We transfer that ownership to the new `Own=
ed<Page>` object.
> >> +        // Since `Page` is transparent, we can cast the pointer direc=
tly.
> >> +        Ok(unsafe { Owned::from_raw(page.cast()) })
> >
> > This doesn't satisfy the safety requirements of Owned::from_raw()
> > because the page may be used with vm_insert_page(), which increments it=
s
> > refcount and causes it to be shared the vma system, and this occurs
> > before Page::release() is called.
>
> I suppose the existing vm_insert_page() abstraction we have is already
> problematic, because it uses `&Page`?
>
> Maybe we want to change the API to use `ARef<Page>` so it already has to =
be
> shared? Conceptually it takes a reference count from a `&Page`, which isn=
't
> possible because `Page` is not `AlwaysRefCounted`, so it needs a `&ARef<P=
age>`
> to be able to do that op.

Honestly, the problem is the safety requirements of Owned::from_raw().
Pages have a "special" main reference, and free_page() does more than
put_page(). It even does something when the refcount does not hit
zero.

The correct behavior for Page is to allow the user to hold one
Owned<Page> whose drop calls free_page(), *plus* any number of
ARef<Page> references that invoke put_page() on drop. This way, the
owned page controls the special drop codepath.

Alice
