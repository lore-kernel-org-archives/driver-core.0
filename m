Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E062E367B89;
	Tue, 13 Oct 2026 11:07:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791889678; cv=none; b=G9ef0NENxSNHYsVRYOhKxa+HyehNkmhenFJMLUFVo6SEJKrVDgLnBwWx9l5ew1numcq6DuaVzIIN75SnDdFJ8jqD6XqoA7VPruTGVUKI3zLfvLgQmqPDrEfcPqXNC5Ou5GjTIC1tEODNAhgL3Uz/cUUdTd9R3SxiJlCudiCPKLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791889678; c=relaxed/simple;
	bh=clBHz8jqLb/gHxHcd/z6kA2QuhPCp5EX6c3TGIzEMtM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=pzHiVFLRjg4VCoUIBKTML21ebJqqaSRK5zgdNErcnhl41ZnEalGI2g/CL3N0RE3IF8EI5SzXZ12olewFn+0sm+3Hr9rlsFMEaJ8DMNM7bjbEZHz9vZc2b3DcUtrmxcZDnnHHRDnpRuwWLajHNsaFjgx1jUgG6lWvOBz61YXORCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GKImCcVX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GKImCcVX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F4321F000FF;
	Tue, 13 Oct 2026 11:07:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791889677;
	bh=ZSWhydPwnGjVmQTHrIt+aT1FeNndN2ccR7i8qMmsYQ0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=GKImCcVX7BlExGaWDJuo0uDFcW2AhnNz/vahq2ceWio6OBpTtQnbsxSnnpNrD3aiy
	 pBQeaNbnFw6UO7Q9stppMU4fTpC7LpTQkAgNaf9j99prl7jtsqnRCPF6vevl1FmbEn
	 nNl9JPcXc/0Nv1UOxOEBfRfcvM+mtDiZCeXIiy7oh48TgH9/lKc3wbCYGeKbOVAnRn
	 tYS5LIYgVGn+ddrhW590Pybu2z9MG/LrxidGyu1QeVnHe/76cj7VoMYY3L6/Q8gcr1
	 SjFRL8c8pg6Oa5SMyhnMzUgsESw5anipxPwBjlAfWFtOijqJ3DW/PsfvqFToE0/7K8
	 80DPK2ITuNpcw==
From: Mark Brown <broonie@kernel.org>
To: Alice Ryhl <aliceryhl@google.com>, 
 Andrew Ballance <andrewjballance@gmail.com>, 
 Michael Reeves <michael.reeves077@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
 "Liam R. Howlett" <liam@infradead.org>, linux-kernel@vger.kernel.org, 
 driver-core@lists.linux.dev, maple-tree@lists.infradead.org, 
 asahi@lists.linux.dev, linux-mm@kvack.org
In-Reply-To: <20261006-regcache-lifecycle-submit-v3-0-37bdd82fd47c@gmail.com>
References: <20261006-regcache-lifecycle-submit-v3-0-37bdd82fd47c@gmail.com>
Subject: Re: [PATCH v3 0/2] regmap: Fix cache lifecycle locking and
 teardown
Message-Id: <179184676097.1099724.2382944643703457917.b4-ty@b4>
Date: Tue, 13 Oct 2026 00:12:40 +0100
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1418; i=broonie@kernel.org;
 h=from:subject:message-id; bh=clBHz8jqLb/gHxHcd/z6kA2QuhPCp5EX6c3TGIzEMtM=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLLOCXLWNUw8lDtDSv3snc7g7oB7P84vYvCcLaGjX6Nw7
 CnnrjzTjlIWBjEuBlkxRZa4LO6X9SWv1/AdXNgGM4eVCWQIAxenAExkMjfD/5jbGxfd2GTAof3g
 y8HKvB0Tnz9vSLA/v8XvcEqUrpvlawGGf9olNQ8tRZqFbjse1eV7wb0x7jm/cteHRj6Pu4FL5p+
 VZAMA
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Tue, 06 Oct 2026 18:03:14 +1100, Michael Reeves wrote:
> regmap: Fix cache lifecycle locking and teardown
> 
> Fix an "Invalid wait context" lockdep warning during Apple GPIO probe and
> correct debugfs ordering during cache teardown.
> 
> Tested on Apple M3 MacBook Air (T8122):
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regmap.git for-7.3

Thanks!

[1/2] regmap: Remove debugfs before cache teardown
      https://git.kernel.org/broonie/misc/c/834035934cef
[2/2] regmap: Drop map lock during cache init and exit
      https://git.kernel.org/broonie/misc/c/abff0a48b110

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

