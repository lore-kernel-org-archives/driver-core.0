Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DB0D416CF2
	for <driver-core@lists.linux.dev>; Tue, 30 Jun 2026 13:02:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782824541; cv=pass; b=fW3kwe80FajU4lSLVQX+0u22D2EA+grOohjGRm8Jl4aF3lX5+jNPajH0GNpRWFq/Z6h238Vw3opIcdIqui0wQcW9H7sF8jqNdWVq8mugNhO1DhMi3o+0TafAXNFA7hJ/QdWUMovvlsXmoz7IO7HJIxSW18a6mY27AsoK8l31/wQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782824541; c=relaxed/simple;
	bh=zVGN+irJoRn6fLQWlrqbDrVdpoX5ulyKwx3V8NzpaKI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qHQZwN2IuwEBafYy32I0d4orh/3787fBucjh52JSGplWlWnycSY8QRDuT7tSAmS3XP38oBBvkImQJ/+wRC8Sgf8X1irYkeJwH2NyeM2c4+plUG4kxfw+Xlo3sbredGx+76HlmoDQrVn+CdS7neZ8YTPVt8ItxePRYgcN9PSP0LI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eqrhI+Dv; arc=pass smtp.client-ip=74.125.82.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eqrhI+Dv"
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-30cb5001e5bso278855eec.1
        for <driver-core@lists.linux.dev>; Tue, 30 Jun 2026 06:02:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782824540; cv=none;
        d=google.com; s=arc-20260327;
        b=PZe1DpnEWq4ZdAeQOVLQT6aJFgFRcIpo9cSy2Wa/M6IKluolFguoS0yLBSorIHlVCj
         YvotJqyGcjQjsKS07gfNql/vEe8usMx1LdfkvDdG+HEvIMV3pqRqlIVpbHsWYmBa7rt5
         FSzy/IQ/mujPcgmZV/ERKbJ1xroInVRmZC20SZErPevQyjkQ31xkillfEiZMRvQ44+Jc
         BWW0jKMQmzZNkERdFFP3LjO7yHJVUWbDeDs1hNu6EfKOeKkaeikEj3btCvOlG3+OBbQd
         oixuwL1uTIDh2IWhUcFzTDlEm7rUa6kmGIrkaUoNtt/7JFT9nPzHY7dm5CMXEpOsH6NO
         H2Qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=32JdvvqJTtjWcr4BtrKwmZqPpf2cS3llz4s7uLQdovU=;
        fh=jNHwfazMUprJxqLRlGmNLus/9oOzJbNjBG9pVtbvSQ8=;
        b=lta3ibniPXQSE/9InlP1kuixZFu2J2OXN7Wst4+tARAjlTt6MvqLvcMVaZt/5FAqRh
         57+fDzjvoeXbi8EweD3SDtUxOumGcvTJF8l6FpwmXnVR7D37kC6SQWLPKXbtIgwxbssm
         f42WoA82GRkb1bW1wgwZlw4Pi+5seXGHMXAIwuqPBd61AWXpQh61poF1XUrT+n3xdq5l
         VQ3UXLvamdes4xzdCR5+av72ZSRsEHbkIa9tn5LWVtKjk6R7dgPJ+Ltnzn3NkWmMJDWf
         nQPLUydBj2Vsu+xZG/SpyFf7X/UiucBHnAPnJXPHDdSFudIsdyNrHFiaV0yCCC5jvp1p
         yQyg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782824540; x=1783429340; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=32JdvvqJTtjWcr4BtrKwmZqPpf2cS3llz4s7uLQdovU=;
        b=eqrhI+Dv60+DTmx7l89ov0yXNRSjVNPMS7tO/WshGer7M2EXVi2R+2wkpa5vTHtde5
         SLz8WFR8jZeutjvCu+owqQq5cY1UIb6sfBQE1uPmYuLJOhtdk6PPmQ4+KC+IdNBpA4E+
         WPX8bUi3Qe7uJSojXNGI2Pm9sAJmo+C71dE2TFEMFFWDrkNiBplPm0t3uq+OTA928DAP
         8dEh+f3U/slX8I/cPkxd7LWVfe7Ys23HrwqQjZTNH9SvBLgPAOzFia1IUZI0+tM1X5Zl
         YV5ED2r7oKvSH2Xxst7bxYQytN+GLtKEhrtdNwjOWUVmcFaTQHlOCGnMN5svu6KTlmB1
         sykg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782824540; x=1783429340;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=32JdvvqJTtjWcr4BtrKwmZqPpf2cS3llz4s7uLQdovU=;
        b=aSXd3/c5eDDLuYN06GFvldkCLowGbcFomItFxUEUbXBwpqiAj/+mGTHKK4ZDwEpW4n
         +hio4DHGsziwpXxCZUFwB5OrmbMXoUrB8TVDCcJqsKNGRlq6/XbziqncWqeOxrYqX1v3
         FvqAOr1do9r7aINCWuj8++8FaH2nxubqDog915CD1dtGz+NpWtOyc7DtPWOmyiMPNn6z
         +YIIZgJ085doTl1dqNQanyC/yEGnAMHoYAKro+ChNhg+wQeQr78aAU7PWwNkZBkUdrTB
         aUmYMjBA0HukDkACHA07MRF3mMyGt3xxAvV/pvDKqE4B1UOMYGzMv5EHFCBTGPv6WhWY
         dr2w==
X-Forwarded-Encrypted: i=1; AHgh+RpIfdfiu8Nj2hhxoKDJlmQEoCmXvk90ZCZsTIKU+uo3cVExQZDIpc++R8Gj6b5CFhufGy7gOhaBDzkCdw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz+tRgiwYbex5rRTr+MUu8/iwBpBXqnkQuNj+TA4HfbrNMXNkrs
	C1l2Z4N9vrnMeJ42XQ1i+ccTET21nbhzgWYxOBTrAP5u1y5bry2DpmJjBWYaANSfZN/Q+LYWDss
	u/fT0Ql16GA/5S+xseVwufbNcfLDhaNI=
X-Gm-Gg: AfdE7cku5saFXsyvvbvHZKWvfHZeAD0ME9tv8pFUKO+0NCDWVZwjxm6zVP2ISDpHtYq
	DetkKggeu2LelbX+6mNOYHgJkiEUwxM71Hs/rbhvyjPLnl0I4ETyI7NzwxsQ72HbJKJCu4ENLPB
	65pZnF6CxzZ4cqyI6UgKVAR7PXKtUAcQgs1CCmkfwcOBy4C7WTr9i7bd0DivaibStnzInF5mpNj
	7cUf1dhJnKYpksebERGh5LUwbQ580Tfnepuw0gKTO5tTfHAB46vcueZzm9NB3t8I6YLz+5r+g2H
	poT1/Liejk2hQ/dAczlhtK5ru0XNRIyB5wnY6bYtyqSlbLsyHdYbL7PaZOB1+1e6qR6+TSEgAkY
	dsWzrZ4AuI9F7
X-Received: by 2002:a05:7300:fd13:b0:30e:b3e5:cc43 with SMTP id
 5a478bee46e88-30ee13cd8b8mr1307107eec.4.1782824538764; Tue, 30 Jun 2026
 06:02:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260626-io_projection-v5-0-d0961471ae50@garyguo.net>
 <DJL2T5XDC53F.3C2QC5L1V2H6@kernel.org> <DJLLHI7FIYM0.2YB1QJ6TB8R6T@garyguo.net>
In-Reply-To: <DJLLHI7FIYM0.2YB1QJ6TB8R6T@garyguo.net>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 30 Jun 2026 15:02:06 +0200
X-Gm-Features: AVVi8CdlaW0HC3qcToqh7v3q0JT2Ai7s9vfzaVZXIxvGTDn0q6fiJzf_f2XS20c
Message-ID: <CANiq72==81FEfMxTnUCdrFBtj9fnCnhF6jXgx_eqE-VsLgW9Rw@mail.gmail.com>
Subject: Re: [PATCH v5 00/20] rust: I/O type generalization and projection
To: Gary Guo <gary@garyguo.net>
Cc: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Daniel Almeida <daniel.almeida@collabora.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Tamir Duberstein <tamird@kernel.org>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Bjorn Helgaas <bhelgaas@google.com>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Abdiel Janulgue <abdiel.janulgue@gmail.com>, Robin Murphy <robin.murphy@arm.com>, 
	Alexandre Courbot <acourbot@nvidia.com>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Michal Wilczynski <m.wilczynski@samsung.com>, =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, 
	driver-core@lists.linux.dev, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org, 
	nova-gpu@lists.linux.dev, dri-devel@lists.freedesktop.org, 
	linux-pwm@vger.kernel.org, Laura Nao <laura.nao@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 29, 2026 at 4:15=E2=80=AFPM Gary Guo <gary@garyguo.net> wrote:
>
> Hmm, this looks like a false positive introduced in new version of rustdo=
c.
> I didn't get this with rustdoc 1.85, but do get it in latest rustc, howev=
er the
> generated link is correct despite the warning.
>
> This pattern is used by other code, I'm unsure why it doesn't trigger the=
re.
> Anyhow, the following diff seems to be able to work around the issue.

It seems to me that the issue is this line at the end:

  /// [`include/linux/iosys-map.h`](srctree/include/linux/iosys-map.h)

should have been:

  /// [`include/linux/iosys-map.h`]: srctree/include/linux/iosys-map.h

i.e. not a false positive.

Or do you mean something else?

Cheers,
Miguel
