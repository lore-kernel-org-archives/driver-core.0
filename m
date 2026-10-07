Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 757B24ABBC4;
	Wed,  7 Oct 2026 14:18:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791382702; cv=none; b=owaYI/rMs03zZoIoUVOVmEACLV7OR0X935UV776KYux2kiXn9wz/OykNaf+Pm76xWdbxAU+tlp7HD7jvklL+LZDFFMMgoN/INDqUV6H4BPsinE7dTM9Uci/183jNyebQ8cFpcUw+8VSKFK5w4KnxI+rnQmhkMwLLcEQ55nGopOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791382702; c=relaxed/simple;
	bh=2Q6TyLD3uLpZohDA6/cj4lYgsrlfmmoWbnSyKIbr4N0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=B+VD38lYYgEPwdDmBfurPvkt0saSV66nilrOxestz16Ds+6cqXjXVuSdHLPFkNV9pPBvygM7WkDyp3qXNwRGqQXl4sZJIEdXoJSboocE8DPHQlSEwip4MG8RBVV3POuzpovA6sQYmn0hKBOXBM4etbMzG457gDX39GhAlZWINuo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ci4a7Tpj; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ci4a7Tpj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BDDE81F0089C;
	Wed,  7 Oct 2026 14:18:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791382695;
	bh=YhLZA+AJA1YfgnKDUQ6nvL29mk+XE4H4nO30XJalByI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Ci4a7Tpj0x/0Ol3ZzVv4nQ100yOL+xXIGI0GJrdSHDGwfF+JPBAV3uCVnOVN53R4Q
	 8ULu53zf5UxgE16/zKN5NKoGN6CGaxfxHLIYGzZdpjQupB9NsC5kmZH0Z+KXfPfS1J
	 3CjO4ujsf8L9/lPyDgvefQ3RC5WuKrenqSjD4zuw0p5ZwNCYJ2nmMXZuroajoUwgfu
	 8et6sh82OFb1SSByAbiUcSeQO+FWTAemZ+m7P/QdxBD519L8p2/Vyl8o6AXA4OclNd
	 jnHt5YT7eiGuMqJnGvcsIgHjMURMiNZih99E0CvPX94bge9QlAjW+am5wjJyy7c44V
	 rZOZqCC4kka+w==
From: Danilo Krummrich <dakr@kernel.org>
To: Karl Mehltretter <kmehltretter@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Yang Yingliang <yangyingliang@huawei.com>,
	Luben Tuikov <ltuikov89@gmail.com>,
	driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] kobject: Fix the kobj_set_name reference in kset_register() kernel-doc
Date: Wed,  7 Oct 2026 16:18:10 +0200
Message-ID: <20261007141810.46083-1-dakr@kernel.org>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20260911222029.7267-1-kmehltretter@gmail.com>
References: <20260911222029.7267-1-kmehltretter@gmail.com>
X-Patch-Reply: applied
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Sat, 12 Sep 2026 00:20:29 +0200, Karl Mehltretter wrote:
> [PATCH] kobject: Fix the kobj_set_name reference in kset_register() kernel-doc

Applied, thanks!

  Branch: driver-core-testing
  Tree:   git://git.kernel.org/pub/scm/linux/kernel/git/driver-core/driver-core.git

[1/1] kobject: Fix the kobj_set_name reference in kset_register() kernel-doc
      commit: 3aac49b236c1

      [ Also drop the misplaced braces in "allocated by()". - Danilo ]

The patch will appear in the next linux-next integration (typically within 24
hours on weekdays).

The patch is in the driver-core-testing branch and will be promoted to
driver-core-next after validation.
